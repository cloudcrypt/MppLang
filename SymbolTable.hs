module Main where 

import Prelude hiding (LT, GT)
import System.Environment
import System.IO
import Parser
import Lexer

data SYM_DESC = ARGUMENT (String,M_type,Int)
              | VARIABLE (String,M_type,Int)
              | FUNCTION (String,[(M_type,Int)],M_type)
              | DATATYPE (String, [String])          -- Changed from DATATYPE String???
              | CONSTRUCTOR (String, [M_type], String)
    deriving (Show)

data SYM_I_DESC = I_VARIABLE (Int,Int,M_type,Int)
                | I_FUNCTION (Int,String,[(M_type,Int)],M_type)
                | I_CONSTRUCTOR (Int,[M_type],String)
                | I_TYPE [String]
    deriving (Show)

data ScopeType = L_PROG | L_FUN M_type | L_BLK | L_CASE
    deriving (Show)

data SYM_VALUE = Var_attr (Int,M_type,Int)
               | Fun_attr (String,[(M_type,Int)],M_type)
               | Con_attr (Int,[M_type],String)
               | Typ_attr [String]
    deriving (Show)

data SYM_TABLE = Sym_tbl (ScopeType,Int,Int,[(String,SYM_VALUE)])
    deriving (Show)

type ST = [SYM_TABLE]

type AST = M_prog

type IR = I_prog

type Array_desc = (Int,[I_expr])

data I_prog = I_PROG ([I_fbody],Int,[(Int,[I_expr])],[I_stmt])
    deriving (Show)
              -- functions, number of local variables, array descriptions, body.
data I_fbody = I_FUN (String,[I_fbody],Int,Int,[(Int,[I_expr])],[I_stmt])
    deriving (Show)
                -- functions, number of local variables, number of arguments
                -- array descriptions, body
data I_stmt = I_ASS (Int,Int,[I_expr],I_expr)
                -- level, offset, array indexes, expressions
            | I_WHILE (I_expr,I_stmt)
            | I_COND (I_expr,I_stmt,I_stmt)
            | I_CASE (I_expr,[(Int,Int,I_stmt)])
                -- each case branch has a constructor number, a number of arguments,
                -- and the code statements
            | I_READ_B (Int,Int,[I_expr])
                -- level, offset, array indexes
            | I_PRINT_B I_expr
            | I_READ_I (Int,Int,[I_expr])
            | I_PRINT_I I_expr
            | I_READ_F (Int,Int,[I_expr])
            | I_PRINT_F I_expr
            | I_READ_C (Int,Int,[I_expr])
            | I_PRINT_C I_expr
            | I_RETURN I_expr
            | I_BLOCK ([I_fbody],Int,[(Int,[I_expr])],[I_stmt])
    deriving (Show)
                -- functions, number of local variables, array descriptions, body.
data I_expr = I_IVAL Int
            | I_RVAL Float
            | I_BVAL Bool
            | I_CVAL Char
            | I_ID (Int,Int,[I_expr])
                -- level, offset, array indices
            | I_APP (I_opn,[I_expr])
            | I_REF (Int,Int)
                -- for passing an array reference as an argument
                -- of a function: level, offset
            | I_SIZE (Int,Int,Int)
    deriving (Show)
                -- for retrieving the dimension of an array: level,offset,dimension
data I_opn = I_CALL (String,Int)
                -- label and level
            | I_CONS (Int,Int)
                -- constructor number and number of arguments
            | I_ADD_I | I_MUL_I | I_SUB_I | I_DIV_I | I_NEG_I
            | I_ADD_F | I_MUL_F | I_SUB_F | I_DIV_F | I_NEG_F
            | I_LT_I  | I_LE_I  | I_GT_I  | I_GE_I  | I_EQ_I
            | I_LT_F  | I_LE_F  | I_GT_F  | I_GE_F  | I_EQ_F
            | I_LT_C  | I_LE_C  | I_GT_C  | I_GE_C  | I_EQ_C
            | I_NOT | I_AND | I_OR | I_FLOAT | I_FLOOR | I_CEIL
    deriving (Show)

empty :: ST
empty = []

newscope :: ScopeType -> ST -> ST
newscope L_PROG st = (Sym_tbl (L_PROG,0,0,[])):st
newscope l_fun_t st = (Sym_tbl (l_fun_t,0,0,[])):st
--   --....

insert :: Int -> ST -> SYM_DESC -> (Int,ST)
insert n [] d =  error "Symbol table error: insertion before defining scope."
insert n ((Sym_tbl(sT,nL,nA,sL)):rest) (ARGUMENT(str,t,dim)) 
      | (inIndexList str sL) = error ("Symbol table error: "++str++" is already defined.")
      | otherwise = (n,(Sym_tbl(sT,nL,nA+1
                        ,(str,Var_attr(-(nA+4),t,dim)):sL)):rest)
insert n ((Sym_tbl (sT,nL,nA,sL)):rest) (VARIABLE (str,t,dim))
       | (inIndexList str sL) = error ("Symbol table error: "++str++" is already defined.")
       | otherwise = (n,(Sym_tbl (sT,nL+1,nA
                         ,(str,Var_attr (nL+1,t,dim)):sL)):rest)
insert n ((Sym_tbl(sT,nL,nA,sL)):rest) (FUNCTION (str,ts,t))
       | (inIndexList str sL) = error ("Symbol table error: "++str++" is already defined.")
       | otherwise = (n+1,(Sym_tbl(sT,nL,nA,(str,Fun_attr("fn-label",ts,t)):sL)
                          ):rest)
insert n ((Sym_tbl(sT,nL,nA,sL)):rest) (DATATYPE (str, cons))
       | (inIndexList str sL) = error ("Symbol table error: "++str++" is already defined.")
       | otherwise = (n,(Sym_tbl(sT,nL,nA,(str,Typ_attr cons):sL)
                          ):rest)
insert n ((Sym_tbl(sT,nL,nA,sL)):rest) (CONSTRUCTOR (name,arg_types,type_str))
       | (inIndexList name sL) = error ("Symbol table error: "++name++" is already defined.")
       | otherwise = (n,(Sym_tbl(sT,nL,nA,(name,Con_attr (-1,arg_types,type_str)):sL)
                          ):rest)

inIndexList :: String -> [(String,SYM_VALUE)] -> Bool
inIndexList str [] = False
inIndexList str ((x,_):xs)
    | str==x = True
    | otherwise = inIndexList str xs

look_up:: ST -> String -> SYM_I_DESC
look_up s x = find 0 s where
  found level (Var_attr(offset,t,dim)) 
                = I_VARIABLE(level,offset,t,dim)
  found level (Fun_attr(label,arg_type,t)) 
                = I_FUNCTION(level,label,arg_type,t)
  found level (Typ_attr cons)
                = I_TYPE cons
  found level (Con_attr (num,arg_types,type_str))
                = I_CONSTRUCTOR (num,arg_types,type_str)
  find_level ((str,v):rest) | x == str = Just v
                            | otherwise =  find_level rest
  find_level [] = Nothing
  find n [] = error ("Could not find "++x)
  find n (Sym_tbl(_,_,_,vs):rest) = 
         (case find_level vs of 
          Just v -> found n v
          Nothing -> find (n+1) rest)

--return:: ST -> M_type

generateIR :: AST -> IR
generateIR (M_prog (decls,stmts)) = I_PROG (fun_irs,(localVarCount st'),array_descs,stmt_irs) where
    st = collectTypesIR decls (newscope L_PROG empty)
    (st', array_descs) = varsIR decls st
    fun_irs = funsIR decls st'
    stmt_irs = stmtsIR stmts st'

collectTypesIR :: [M_decl] -> ST -> ST
collectTypesIR (d:ds) st = collectTypesIR ds st' where
    st' = collectTypeIR d st
collectTypesIR [] st = st

varsIR :: [M_decl] -> ST -> (ST, [Array_desc])
varsIR (d:ds) st = (st'', array_descs++array_descs') where
    (st', array_descs) = varIR d st
    (st'', array_descs') = varsIR ds st'
varsIR [] st = (st, [])

funsIR :: [M_decl] -> ST -> [I_fbody]
funsIR (d:ds) st = (funIR d st)++(funsIR ds st)
funsIR [] st = []

collectTypeIR :: M_decl -> ST -> ST
collectTypeIR _ st = st

varIR :: M_decl -> ST -> (ST, [Array_desc])
varIR (M_var (str,exprs,t)) st = result where
    dim_exprs = exprsIR exprs $ tail st
    all_ints = allInt $ map snd dim_exprs
    type_ir = typeIR t st
    (n, st') = insert 0 st (getSymDesc (M_var (str,exprs,type_ir)))
    dims = map fst dim_exprs
    array_desc = case (length dims) > 0 of
                    True -> [((getLastOffset st'),dims)]
                    False -> []
    result = case all_ints of
                True -> (st', array_desc)
                False -> error "TypeError: All array dimensions must be of type 'int'"
varIR _ st = (st, [])

funIR :: M_decl -> ST -> [I_fbody]
funIR _ st = []

stmtsIR :: [M_stmt] -> ST -> [I_stmt]
stmtsIR stmts st = map (\s -> stmtIR s st) stmts

stmtIR :: M_stmt -> ST -> I_stmt
stmtIR (M_print expr) st = let (expr_ir, t) = exprIR expr st in
                             case t of
                               M_int -> I_PRINT_I expr_ir
                               M_bool -> I_PRINT_B expr_ir
                               M_real -> I_PRINT_F expr_ir
                               M_char -> I_PRINT_C expr_ir
                               _ -> error ("TypeError: Wrong type '"++(printType t)++"' supplied to print")

exprsIR :: [M_expr] -> ST -> [(I_expr,M_type)]
exprsIR exprs st = map (\e -> exprIR e st) exprs

exprIR :: M_expr -> ST -> (I_expr,M_type)
exprIR (M_ival i) st = ((I_IVAL i),M_int)
exprIR (M_rval i) st = ((I_RVAL i),M_real)
exprIR (M_bval i) st = ((I_BVAL i),M_bool)
exprIR (M_cval i) st = ((I_CVAL i),M_char)
exprIR (M_id (str,exprs)) st = result where
    I_VARIABLE (level,offset,t,dims) = look_up st str
    indice_exprs = exprsIR exprs st
    all_ints = allInt $ map snd indice_exprs
    equal_dims = checkDims dims (length exprs)
    indices = map fst indice_exprs
    result = case all_ints of
                True -> case equal_dims of
                            True -> ((I_ID (level,offset,indices)),t)
                            False -> error ("TypeError: Incorrect dimensions for array '"++str++"':\n"
                                            ++"\tProvided dimensions: "++(show (length exprs))++"\n"
                                            ++"\tActual dimensions:   "++(show dims))
                False -> error "TypeError: All array dimensions must be of type 'int'"

typeIR :: M_type -> ST -> M_type
typeIR M_int st = M_int
typeIR (M_type str) st = t where
    I_TYPE _ = look_up st str
    t = M_type str
typeIR t st = t

localVarCount :: ST -> Int
localVarCount ((Sym_tbl (_,n,_,_)):rest) = n

allInt :: [M_type] -> Bool
allInt (t:ts) = case t of
                  M_int -> allInt ts
                  _ -> False
allInt [] = True

checkDims :: Int -> Int -> Bool
checkDims n m 
    | n == m = True
    | otherwise = False

getLastOffset :: ST -> Int
getLastOffset ((Sym_tbl (_,_,_,(_,Var_attr (offset,_,_)):_)):_) = offset

getSymDesc :: M_decl -> SYM_DESC
getSymDesc (M_var (s, arraydims, t)) = VARIABLE (s, t, length arraydims)
--getSymDesc (M_fun (s, args, t, decls, _)) = FUNCTION (s, (reverse $ map (\(_,n,a_t) -> (a_t,n)) args), t)

--generateIR :: AST -> IR
--generateIR (M_prog (decls,stmts)) = I_PROG ([],(localVarCount $ head st),[],stmt_irs) where
--    st = collect_decls decls (newscope L_PROG empty)
--    stmt_irs = stmtsIR stmts st

--collect_decls :: [M_decl] -> ST -> ST
--collect_decls (decl:decls) st = collect_decls decls st' where
--    (n, st') = insert 0 st (getSymDesc decl)
--collect_decls [] st = st

----collect_decl :: M_decl -> ST -> (ST, Maybe Array_desc)
----collect_decl decl st = let (n, st') = insert 0 st (getSymDesc d) in
----                        case isArray decl of
----                            True -> (st', Just )

----arrayDescs :: ST -> [Array_desc]
----arrayDescs ((Sym_tbl (_,_,_,(varattrs:_)):_)

--stmtsIR :: [M_stmt] -> ST -> [I_stmt]
--stmtsIR stmts st = map (\stmt -> stmtIR stmt st) stmts

--stmtIR :: M_stmt -> ST -> I_stmt
--stmtIR (M_print expr) st = let (expr_ir,t) = exprIR expr st in
--                            case t of
--                                M_int -> I_PRINT_I expr_ir
--                                M_bool -> I_PRINT_B expr_ir
--                                M_real -> I_PRINT_F expr_ir
--                                M_char -> I_PRINT_C expr_ir
--                                _ -> error ("TypeError: Wrong type '"++(printType t)++"' supplied to print")

--exprIR :: M_expr -> ST -> (I_expr, M_type)
--exprIR (M_ival i) st = ((I_IVAL i),M_int)
--exprIR (M_id (s,exprs)) st = (I_ID (level,offset,(map (\e -> fst $ exprIR e st) exprs)),t) where
--    I_VARIABLE (level,offset,t,_) = look_up st s

--isArray :: M_decl -> Bool
--isArray (M_var (_,exprs,_)) = case length exprs of
--                                0 -> False
--                                _ -> True
--isArray _ = False

--generateST :: AST -> ST
--generateST (M_prog (decls,stmts)) = generateDeclST to_insert st' where
--    (to_insert, st) = insertDecls decls [] (newscope L_PROG empty)
--    st' = insertStmts stmts st

--generateBlockST :: M_stmt -> ST -> ST
--generateBlockST (M_block (decls,stmts)) st = generateDeclST to_insert st'' where
--    (to_insert, st') = insertDecls decls [] (newscope L_BLK st)
--    st'' = insertStmts stmts st'

--generateDeclST :: [M_decl] -> ST -> ST
--generateDeclST ((M_fun (_,args,t,decls,stmts)):rest) st = generateDeclST rest' st''' where
--  (rest', st') = insertDecls decls rest (newscope (L_FUN t) st)
--  st'' = insertArgs (reverse $ map getArgDesc args) st'
--  st''' = insertStmts stmts st''
--generateDeclST (_:rest) st = generateDeclST rest st
--generateDeclST [] st = st

--insertDecls :: [M_decl] -> [M_decl] -> ST -> ([M_decl], ST)
--insertDecls (d:ds) to_insert st = insertDecls ds (to_insert++[d]) st' where
--  (n, st') = insert 0 st (getSymDesc d)
--insertDecls [] to_insert st = (to_insert, st)

--insertStmts :: [M_stmt] -> ST -> ST
--insertStmts ((M_while (_,stmt)):rest) st = insertStmts (rest++[stmt]) st
--insertStmts ((M_cond (_,stmt1,stmt2)):rest) st = insertStmts (rest++[stmt1,stmt2]) st
--insertStmts ((M_block b):rest) st = insertStmts rest st' where
--  st' = generateBlockST (M_block b) st
--insertStmts (_:rest) st = insertStmts rest st
--insertStmts [] st = st

--insertArgs :: [SYM_DESC] -> ST -> ST
--insertArgs (arg:args) st = insertArgs args st' where
--  (n, st') = insert 0 st arg
--insertArgs [] st = st

--getArgDesc :: (String,Int,M_type) -> SYM_DESC
--getArgDesc (s,n,t) = ARGUMENT (s,t,n)

main :: IO ()
main = do
    args <- getArgs
    -- Check if proper number of args were supplied
    case (length args) of
        1 -> do
            -- Perform lexing and get tokens
            ts <- lexer (head args)
            -- | Check if there are any errors in the list of tokens
            case (length (filter isError ts)) of
                0 -> do
                    -- Recognize grammar, and build abstract syntax tree
                    let ast = parse ts
                    print ast
                    -- Print syntax tree (converted back to readable code)
                    putStr "\nParsed Syntax Tree:\n\n"
                    putStrLn $ printAST ast

                    putStrLn ""

                    let ir = generateIR ast
                    print ir

                _ -> printErrors (filter isError ts)
        _ -> do
            putStrLn "Usage: inputFilename"
