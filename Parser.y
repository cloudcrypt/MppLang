

-- Daniel Dastoor
{

module Parser where

import Prelude hiding (LT, GT)
import System.Environment
import System.IO
import Data.List
import Lexer

}

%name parse
%tokentype { Token }
%error { parseError }

%token
    T_ADD	{ ADD _ }
    T_SUB	{ SUB _ }
    T_MUL   { MUL _ }
    T_DIV	{ DIV _ }
    T_ARROW	{ ARROW _ }
    T_AND  	{ AND _ }
    T_OR   	{ OR _ }
    T_NOT  	{ NOT _ }
    T_EQUAL	{ EQUAL _ }
    T_LT   	{ LT _ }
    T_GT   	{ GT _ }
    T_LE   	{ LE _ }
    T_GE   	{ GE _ }
    T_ASSIGN    { ASSIGN _ }
    T_LPAR	{ LPAR _ }
    T_RPAR	{ RPAR _ }
    T_CLPAR	{ CLPAR _ }
    T_CRPAR	{ CRPAR _ }
    T_SLPAR	{ SLPAR _ }
    T_SRPAR	{ SRPAR _ }
    T_SLASH	{ SLASH _ }
    T_COLON	{ COLON _ }
    T_SEMICOLON	{ SEMICOLON _ }
    T_COMMA	{ COMMA _ }
    T_IF	{ IF _ }
    T_THEN	{ THEN _ }
    T_WHILE	{ WHILE _ }
    T_DO	{ DO _ }
    T_READ	{ READ _ }
    T_ELSE	{ ELSE _ }
    T_BEGIN	{ BEGIN _ }
    T_END	{ END _ }
    T_CASE	{ CASE _ }
    T_OF	{ OF _ }
    T_PRINT	{ PRINT _ }
    T_INT	{ INT _ }
    T_BOOL	{ BOOL _ }
    T_CHAR	{ CHAR _ }
    T_REAL	{ REAL _ }
    T_VAR	{ VAR _ }
    T_DATA	{ DATA _ }
    T_SIZE	{ SIZE _ }
    T_FLOAT	{ FLOAT _ }
    T_FLOOR	{ FLOOR _ }
    T_CEIL	{ CEIL _ }
    T_FUN	  { FUN _ }
    T_RETURN  { RETURN _ }
    T_CID     { CID _ $$ }
    T_ID      { ID _ $$ }
    T_RVAL    { RVAL _ $$ }
    T_IVAL    { IVAL _ $$ }
    T_BVAL    { BVAL _ $$ }
    T_CVAL    { CVAL _ $$ }

%%

prog    : block                         { M_prog $1 }

block   : declarations program_body     { ($1, $2) }    -- ([M_dec], [M_stmt])

declarations    : declaration T_SEMICOLON declarations  { $1++$3 } -- [M_dec]
                |                                       { [] }

declaration     : var_declaration       { $1 } -- [M_var]
                | fun_declaration       { [$1] } -- [M_fun]
                | data_declaration      { [$1] } -- [M_data]

-- M+ version:
-- var_declaration : T_VAR T_ID array_dimensions T_COLON type      { M_var ($2, $3, $>) } -- M_var (String,[M_expr],M_type)

-- M++ version:
var_declaration : T_VAR var_specs T_COLON type      { map (\x -> (M_var ((fst x), (snd x), $>))) $2 } -- M++: produces [M_var]

var_specs       : var_spec more_var_specs           { [$1]++$2 }    -- [(String, [M_expr])]
    
more_var_specs  : T_COMMA var_spec more_var_specs   { [$2]++$3 }    -- [(String, [M_expr])]
                |                                   { [] }

var_spec        : T_ID array_dimensions             { ($1, $2) }    -- (String, [M_expr])

array_dimensions    : T_SLPAR expr T_SRPAR array_dimensions     { [$2]++$4 }    -- [M_expr]
                    |                                           { [] }

type    : T_INT     { M_int }
        | T_REAL    { M_real }
        | T_BOOL    { M_bool }
        | T_CHAR    { M_char }
        | T_ID      { M_type $1 }

fun_declaration : T_FUN T_ID param_list T_COLON type T_CLPAR fun_block T_CRPAR  { let tpl = $7 in M_fun ($2, $3, $5, (fst tpl), (snd tpl)) }

fun_block       : declarations fun_body             { ($1, $2) }

param_list      : T_LPAR parameters T_RPAR          { $2 }

parameters      : basic_declaration more_parameters { [$1]++$2 }    -- [(String, Int, Type)]
                |                                   { [] }

more_parameters : T_COMMA basic_declaration more_parameters     { [$2]++$3 }    -- [(String, Int, Type)]
                |                                               { [] }

basic_declaration   : T_ID basic_array_dimensions T_COLON type      { ($1, $2, $>) }    -- (String, Int, Type)

basic_array_dimensions  : T_SLPAR T_SRPAR basic_array_dimensions    { $3+1 }
                        |                                           { 0 }

data_declaration    : T_DATA T_ID T_EQUAL cons_declarations         { M_data ($2, $4) }

cons_declarations   : cons_decl more_cons_decl                      { [$1]++$2 }    -- [(String, [M_type])]

more_cons_decl      : T_SLASH cons_decl more_cons_decl              { [$2]++$3 }    -- [(String, [M_type])]
                    |                                               { [] }

cons_decl           : T_CID T_OF type_list                          { ($1, $3) }    -- (String, [M_type])
                    | T_CID                                         { ($1, []) }

type_list           : type more_type                                { [$1]++$2 }    -- [M_type]

more_type           : T_MUL type more_type                          { [$2]++$3 }    -- [M_type]
                    |                                               { [] } 

program_body        : T_BEGIN prog_stmts T_END                      { $2 }    -- [M_stmt]
                    | prog_stmts                                    { $1 }

fun_body    : T_BEGIN prog_stmts T_RETURN expr T_SEMICOLON T_END    { $2++[(M_return $4)] }    -- [M_stmt]
            | prog_stmts T_RETURN expr T_SEMICOLON                  { $1++[(M_return $3)] }

prog_stmts  : prog_stmt T_SEMICOLON prog_stmts      { [$1]++$3 }    -- [M_stmt]
            |                                       { [] }

prog_stmt   : T_IF expr T_THEN prog_stmt T_ELSE prog_stmt   { M_cond ($2, $4, $>) }
            | T_WHILE expr T_DO prog_stmt                   { M_while ($2, $>) }
            | T_READ location                               { M_read $2 }
            | location T_ASSIGN expr                        { let tpl = $1 in M_ass ((fst tpl), (snd tpl), $>) }
            | T_PRINT expr                                  { M_print $2 }
            | T_CLPAR block T_CRPAR                         { M_block $2 }
            | T_CASE expr T_OF T_CLPAR case_list T_CRPAR    { M_case ($2, $5) }

location    : T_ID array_dimensions     { ($1, $2) }    -- (String, [M_expr])

case_list   : case more_case            { [$1]++$2 }    -- [(String, [String], M_stmt)]

more_case   : T_SLASH case more_case    { [$2]++$3 }
            |                           { [] }

case        : T_CID var_list T_ARROW prog_stmt  { ($1, $2, $>) }    -- (String, [String], M_stmt)

var_list    : T_LPAR var_list1 T_RPAR           { $2 }  -- [String]
            |                                   { [] }

var_list1   : T_ID more_var_list1               { [$1]++$2 }    -- [String]

more_var_list1  : T_COMMA T_ID more_var_list1   { [$2]++$3 }    -- [String]
                |                               { [] }

expr        : expr T_OR bint_term               { M_app (M_or, [$1]++[$3]) }
            | bint_term                         { $1 }

bint_term   : bint_term T_AND bint_factor       { M_app (M_and, [$1]++[$3]) }
            | bint_factor                       { $1 }

bint_factor : T_NOT bint_factor                 { M_app (M_not, [$2]) }
            | int_expr compare_op int_expr      { M_app ($2, [$1]++[$3]) }
            | int_expr                          { $1 }

compare_op  : T_EQUAL                           { M_eq }
            | T_LT                              { M_lt }
            | T_GT                              { M_gt }
            | T_LE                              { M_le }
            | T_GE                              { M_ge }

int_expr    : int_expr addop int_term           { M_app ($2, [$1]++[$3]) }
            | int_term                          { $1 }

addop       : T_ADD                             { M_add }
            | T_SUB                             { M_sub }

int_term    : int_term mulop int_factor         { M_app ($2, [$1]++[$3]) }
            | int_factor                        { $1 }

mulop       : T_MUL                             { M_mul }
            | T_DIV                             { M_div }

int_factor  : T_LPAR expr T_RPAR                { $2 }    -- M_expr
            | T_SIZE T_LPAR T_ID basic_array_dimensions T_RPAR  { M_size ($3, $4) }
            | T_FLOAT T_LPAR expr T_RPAR        { M_app (M_float, [$3]) }
            | T_FLOOR T_LPAR expr T_RPAR        { M_app (M_floor, [$3]) }
            | T_CEIL T_LPAR expr T_RPAR         { M_app (M_ceil, [$3]) }
            | T_ID modifier_list                { let tpl = $2 in case (fst tpl) of
                                                                    NonFunctionDetected -> M_id ($1, (snd tpl)) 
                                                                    FunctionDetected -> M_app ((M_fn $1), (snd tpl)) }
            | T_CID cons_argument_list          { M_app ((M_cid $1), $2) }
            | T_IVAL                            { M_ival $1 }   -- M_expr
            | T_RVAL                            { M_rval $1 }
            | T_BVAL                            { M_bval $1 }
            | T_CVAL                            { M_cval $1 }
            | T_SUB int_factor                  { M_app (M_neg, [$2]) }

modifier_list   : fun_argument_list             { (FunctionDetected, $1) }    -- [M_expr]
                | array_dimensions              { (NonFunctionDetected, $1) }    -- [M_expr]

fun_argument_list   : T_LPAR arguments T_RPAR   { $2 }      -- [M_expr]

cons_argument_list  : fun_argument_list         { $1 }      -- [M_expr]    
                    |                           { [] }

arguments           : expr more_arguments       { [$1]++$2 }    -- [M_expr]
                    |                           { [] }

more_arguments      : T_COMMA expr more_arguments   { [$2]++$3 }    -- [M_expr]
                    |                               { [] }

{

-- | Displays ParseErrors with line and column number if present
parseError :: [Token] -> a
parseError (t:ts) = error $ errorString (pos t) "ParseError: Syntax error"
parseError _ = error "ParseError"

-- | Data type definition for detecting modifier_list type
data Detected = FunctionDetected
              | NonFunctionDetected

-- | Data type definitions for the abstract syntax tree
data M_prog = M_prog ([M_decl],[M_stmt])
            deriving (Eq, Show)
data M_decl = M_var (String,[M_expr],M_type)
            | M_fun (String,[(String,Int,M_type)],M_type,[M_decl],[M_stmt])
            | M_data (String,[(String,[M_type])])
            deriving (Eq, Show)
data M_stmt = M_ass (String,[M_expr],M_expr)
            | M_while (M_expr,M_stmt)
            | M_cond (M_expr,M_stmt,M_stmt)
            | M_read (String,[M_expr])
            | M_print M_expr
            | M_return M_expr
            | M_block ([M_decl],[M_stmt])
            | M_case (M_expr,[(String,[String],M_stmt)])
            deriving (Eq, Show)
data M_type = M_int | M_bool | M_real | M_char | M_type String
            deriving (Eq, Show)
data M_expr = M_ival Int
            | M_rval Float
            | M_bval Bool
            | M_cval Char
            | M_size (String,Int)
            | M_id (String,[M_expr])
            | M_app (M_operation,[M_expr])
            deriving (Eq, Show)
data M_operation
            = M_fn String
            | M_cid String
            | M_add | M_mul | M_sub | M_div | M_neg
            | M_lt | M_le | M_gt | M_ge | M_eq | M_not | M_and | M_or
            | M_float | M_floor | M_ceil
            deriving (Eq, Show)

-- class DeclContainer a where
--     getDecls :: a -> [M_decl]

-- instance DeclContainer M_prog where
--     getDecls (M_prog (decls,_)) = decls

-- -- instance DeclContainer M_decl where
-- --     getDecls (M_fun (_,_,_, decls,_)) = decls
-- instance DeclContainer M_decl

{-|
    Function to convert the abstract syntax tree back to readable code.
    Recursively traverses the M_prog abstarct syntax tree and generates code as a string.
-}
printAST :: M_prog -> String
printAST (M_prog (decls, stmts)) = (ifExists decls ((intercalate ";\n" (map printDecl decls))++";\n"))++"begin\n"++(ifExists stmts ((intercalate ";\n" (map printStmt stmts))++";\n"))++"end"

-- | Function to convert a declaration back to readable code
printDecl :: M_decl -> String
printDecl (M_var (s, arraydims, t)) = "var "++(printArrayDecl s arraydims)++":"++(printType t)
printDecl (M_fun (s, args, t, decls, stmts)) = "fun "++s++"("++(intercalate ", " $ map printArg args)++")"++":"++(printType t)++"\n{\n"++(ifExists decls ((indent $ intercalate ";\n" (map printDecl decls))++";\n"))++(ifExists stmts ((indent $ intercalate ";\n" (map printStmt stmts))++";\n"))++"}"
printDecl (M_data (s, dataline:datalines)) = "data "++s++"\n"++"\t= "++(printDataLine dataline)++"\n"++(indent (intercalate "\n" (map (\d -> "| "++(printDataLine d)) datalines)))

-- | Function to convert a data type definition line back to readable code
printDataLine :: (String, [M_type]) -> String
printDataLine (s, ts) = s++" of "++(intercalate " * " $ map printType ts)

-- | Function to convert a function argument back to readable code
printArg :: (String, Int, M_type) -> String
printArg (s, n, t) = s++(concat $ replicate n "[]")++":"++(printType t)

-- | Function to convert a statment back to readable code
printStmt :: M_stmt -> String
printStmt (M_ass (s, arraydims, expr)) = (printArrayDecl s arraydims)++":="++(printExpr expr)
printStmt (M_while (expr, stmt)) = "while "++(printExpr expr)++" do\n"++(indent $ printStmt stmt)
printStmt (M_cond (expr, stmt1, stmt2)) = "if "++(printExpr expr)++" then\n"++(indent $ printStmt stmt1)++"\nelse\n"++(indent $ printStmt stmt2)
printStmt (M_read (s, arraydims)) = "read "++(printArrayDecl s arraydims)
printStmt (M_print expr) = "print "++(printExpr expr)
printStmt (M_return expr) = "return "++(printExpr expr)
printStmt (M_block (decls, stmts)) = (ifExists decls ("{\n"++(indent $ intercalate ";\n" (map printDecl decls))++";\n}\n"))++"begin\n"++(ifExists stmts ((indent $ intercalate ";\n" (map printStmt stmts))++";\n"))++"end"
printStmt (M_case (expr, caselines)) = "case "++(printExpr expr)++" of {\n"++(indent $ intercalate "\n" (map printCase caselines))++"\n}"

-- | Function to convert a case of caseline back to readable code
printCase :: (String, [String], M_stmt) -> String
printCase (s, args, stmt) = s++"("++(intercalate "," args)++") => "++(printStmt stmt)

-- | Function that returns the given string if the list contains items. Returns the empty string otherwise.
ifExists :: [a] -> String -> String
ifExists (a:as) str = str
ifExists [] str = ""

-- | Function to convert a type back to readable code
printType :: M_type -> String
printType M_int = "int"
printType M_bool = "bool"
printType M_real = "real"
printType M_char = "char"
printType (M_type s) = s

-- | Function to convert a expression back to readable code
printExpr :: M_expr -> String
printExpr (M_ival i) = show i
printExpr (M_rval f) = show f
printExpr (M_bval True) = "true"
printExpr (M_bval False) = "false"
printExpr (M_cval c) = show c
printExpr (M_size (s, i)) = "size("++s++(concat $ replicate i "[]")++")"
printExpr (M_id (s, exprs)) = printArrayDecl s exprs
printExpr (M_app (M_fn s, exprs)) = s++"("++(intercalate "," $ map (\e -> printExpr e) exprs)++")"
printExpr (M_app (M_cid s, exprs)) = s++"("++(intercalate "," $ map (\e -> printExpr e) exprs)++")"
printExpr (M_app (M_float, exprs)) = "float"++"("++(intercalate "," $ map (\e -> printExpr e) exprs)++")"
printExpr (M_app (M_ceil, exprs)) = "ceil"++"("++(intercalate "," $ map (\e -> printExpr e) exprs)++")"
printExpr (M_app (M_floor, exprs)) = "floor"++"("++(intercalate "," $ map (\e -> printExpr e) exprs)++")"
printExpr (M_app (M_neg, exprs)) = (printOp M_neg)++(printExpr (exprs !! 0))
printExpr (M_app (M_not, exprs)) = (printOp M_not)++" "++(printExpr (exprs !! 0))
printExpr (M_app (op, exprs)) = (printExpr (exprs !! 0))++(printOp op)++(printExpr (exprs !! 1))

-- | Function to convert a identifier or identifier with array dimensions and info back to readable code
printArrayDecl :: String -> [M_expr] -> String
printArrayDecl s exprs = s++(concat $ (map (\e -> "["++(printExpr e)++"]") exprs))

-- | Function to convert an operation back to readable code
printOp :: M_operation -> String
printOp (M_fn s) = s
printOp (M_cid s) = s
printOp M_add = "+"
printOp M_mul = "*"
printOp M_sub = "-"
printOp M_div = "/"
printOp M_neg = "-"
printOp M_lt = "<"
printOp M_le = "=<"
printOp M_gt = ">"
printOp M_ge = ">="
printOp M_eq = "="
printOp M_not = "not"
printOp M_and = "&&"
printOp M_or = "||"
printOp M_float = "float"
printOp M_floor = "floor"
printOp M_ceil = "ceil"

-- | Takes a newline-separated string, and inserts 1 tab character at the start of each line
indent :: String -> String
indent s = intercalate "\n" $ map (\line -> (replicate 1 '\t')++line) (lines s)

intersperse :: String -> String -> String
intersperse s str = (head ls)++nl++(intercalate "\n" $ map (\line -> s++line) (tail ls))
    where 
        ls = lines str
        nl = case (length ls) > 1 of
                True -> "\n"
                _ -> ""

--main :: IO ()
--main = do
--    args <- getArgs
--    -- Check if proper number of args were supplied
--    case (length args) of
--        1 -> do
--            -- Perform lexing and get tokens
--            ts <- lexer (head args)
--            -- | Check if there are any errors in the list of tokens
--            case (length (filter isError ts)) of
--                0 -> do
--                    -- Recognize grammar, and build abstract syntax tree
--                    let ast = parse ts
--                    -- Print syntax tree (converted back to readable code)
--                    putStr "Parsed Syntax Tree:\n\n"
--                    putStr $ printAST ast
--                _ -> printErrors (filter isError ts)
--        _ -> do
--            putStrLn "Usage: inputFilename"

}
