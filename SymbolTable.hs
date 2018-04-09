module Main where 

import Prelude hiding (LT, GT)
import System.Environment
import System.IO
import Data.List hiding (insert)
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

data SYM_TYPE = ST_VAR | ST_FUN | ST_CON | ST_TYPE

instance Show SYM_TYPE where
    show ST_VAR = "variable"
    show ST_FUN = "function"
    show ST_CON = "type constructor"
    show ST_TYPE = "type"

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
newscope scope_type st = (Sym_tbl (scope_type,0,0,[])):st
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
  find n [] = error ("ScopeError: '"++x++"' could not be found in scope")
  find n (Sym_tbl(_,_,_,vs):rest) = 
         (case find_level vs of 
          Just v -> found n v
          Nothing -> find (n+1) rest)

look_up_verify :: SYM_TYPE -> ST -> String -> SYM_I_DESC
look_up_verify t@ST_VAR s x = case look_up s x of
                            I_VARIABLE found -> I_VARIABLE found
                            _ -> error $ lookUpError x t
look_up_verify t@ST_FUN s x = case look_up s x of
                            I_FUNCTION found -> I_FUNCTION found
                            _ -> error $ lookUpError x t
look_up_verify t@ST_CON s x = case look_up s x of
                            I_CONSTRUCTOR found -> I_CONSTRUCTOR found
                            _ -> error $ lookUpError x t
look_up_verify t@ST_TYPE s x = case look_up s x of
                            I_TYPE found -> I_TYPE found
                            _ -> error $ lookUpError x t                                                        

lookUpError :: String -> SYM_TYPE -> String
lookUpError str t = "ScopeError: '"++str++"' is not a valid "++(show t)++" in scope"

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
collectTypeIR (M_data (str,cons)) st = st'' where
    (n, st') = insert 0 st (getSymDesc (M_data (str,cons)))
    st'' = consIR str cons st'
collectTypeIR _ st = st

consIR :: String -> [(String,[M_type])] -> ST -> ST
consIR datatype_name (con:cons) st = consIR datatype_name cons st' where
    st' = conIR datatype_name con st
consIR _ [] st = st

conIR :: String -> (String,[M_type]) -> ST -> ST
conIR datatype_name (str,types) st = st' where
    types_ir = typesIR types st
    (n, st') = case isTypes types_ir of
                True -> insert 0 st (CONSTRUCTOR (str,types_ir,datatype_name))
                _ -> error "bbbb!"

varIR :: M_decl -> ST -> (ST, [Array_desc])
varIR (M_var (str,exprs,t)) st = result where
    dim_exprs = exprsIR exprs $ tail st
    all_ints = allInt $ map t_snd dim_exprs
    type_ir = typeIR t st
    (n, st') = case isType type_ir of
                True -> insert 0 st (getSymDesc (M_var (str,exprs,type_ir)))
                _ -> error "aaaaa!"
    dims = map t_fst dim_exprs
    array_desc = case (length dims) > 0 of
                    True -> [((getLastOffset st'),dims)]
                    False -> []
    result = case all_ints of
                True -> (st', array_desc)
                False -> error "TypeError: All array dimensions must be of type 'int'"
varIR _ st = (st, [])

funIR :: M_decl -> ST -> [I_fbody]
funIR (M_fun (str,args,t,decls,stmts)) st = result where
    st' = collectArgs (reverse args) (newscope (L_FUN t) st)
    st'' = collectTypesIR decls st'
    (st''', array_descs) = varsIR decls st''
    fun_irs = funsIR decls st'''
    stmt_irs = stmtsIR stmts st'''
    M_return return_expr = last stmts
    result = let pt = (t_snd (exprIR return_expr st''')) in case pt == t of
                True -> [I_FUN (str,fun_irs,(localVarCount st'''),(argsCount st'),array_descs,stmt_irs)]
                _ -> error ("TypeError: Return type mismatch for function '"++str++"'\n"
                            ++"\tProvided return type: '"++(printType pt)++"'\n"
                            ++"\tActual return type:   '"++(printType t)++"'")
funIR _ st = []

collectArgs :: [(String,Int,M_type)] -> ST -> ST
collectArgs (arg:args) st = collectArgs args st' where
    st' = collectArg arg st
collectArgs [] st = st 

collectArg :: (String,Int,M_type) -> ST -> ST
collectArg (str,dim,t) st = result where
    type_ir = typeIR t st
    result = case isType type_ir of
                True -> snd $ insert 0 st (ARGUMENT (str,t,dim))
                _ -> error "An unexpected error has occured (collectArg)"

stmtsIR :: [M_stmt] -> ST -> [I_stmt]
stmtsIR stmts st = map (\s -> stmtIR s st) stmts

stmtIR :: M_stmt -> ST -> I_stmt
stmtIR (M_ass (str, exprs, expr)) st = result where
    ((I_ID (level,offset,indices)),t1,_) = exprIR (M_id (str,exprs)) st
    (expr_ir,t2,_) = exprIR expr st
    result = case t1 == t2 of    -- can you do var x[4][4]:int; var y[4]; x[1] := y;???
                True -> I_ASS (level,offset,indices,expr_ir)
                _ -> error ("TypeError: Type mismatch in assignment:\n"
                            ++"\tType of '"++str++"' is '"++(printType t1)
                            ++"', but type of expression is '"++(printType t2)++"'")
stmtIR (M_while (expr, stmt)) st = result where
    (expr_ir,t,_) = exprIR expr st
    stmt_ir = stmtIR stmt st
    result = case t of
                M_bool -> I_WHILE (expr_ir,stmt_ir)
                _ -> error ("TypeError: While statement expression must be of type "++(printType M_bool))
stmtIR (M_cond (expr,s1,s2)) st = result where
    (expr_ir,t,_) = exprIR expr st
    s1_ir = stmtIR s1 st
    s2_ir = stmtIR s2 st
    result = case t of
                M_bool -> I_COND (expr_ir,s1_ir,s2_ir)
                _ -> error ("TypeError: If statement expression must be of type "++(printType M_bool))
stmtIR (M_read (str,exprs)) st = result where
    ((I_ID (level,offset,indices)),t,_) = exprIR (M_id (str,exprs)) st
    result = case t of
                M_int -> I_READ_I (level,offset,indices)
                M_bool -> I_READ_B (level,offset,indices)
                M_real -> I_READ_F (level,offset,indices)
                M_char -> I_READ_C (level,offset,indices)
                _ -> error ("TypeError: Wrong type '"++(printType t)++"' supplied to read")
stmtIR (M_print expr) st = let (expr_ir, t, _) = exprIR expr st in
                             case t of
                               M_int -> I_PRINT_I expr_ir
                               M_bool -> I_PRINT_B expr_ir
                               M_real -> I_PRINT_F expr_ir
                               M_char -> I_PRINT_C expr_ir
                               _ -> error ("TypeError: Wrong type '"++(printType t)++"' supplied to print")
stmtIR (M_return expr) st = I_RETURN (t_fst $ exprIR expr st)
stmtIR (M_block (decls,stmts)) st = I_BLOCK (fun_irs,(localVarCount st''),array_descs,stmt_irs) where
    st' = collectTypesIR decls (newscope L_BLK st)
    (st'', array_descs) = varsIR decls st'
    fun_irs = funsIR decls st''
    stmt_irs = stmtsIR stmts st''
stmtIR lol st = error ("recieved: "++(show lol))

exprsIR :: [M_expr] -> ST -> [(I_expr,M_type,Int)]
exprsIR exprs st = map (\e -> exprIR e st) exprs

exprIR :: M_expr -> ST -> (I_expr,M_type,Int)
exprIR (M_ival i) st = ((I_IVAL i),M_int,0)
exprIR (M_rval i) st = ((I_RVAL i),M_real,0)
exprIR (M_bval i) st = ((I_BVAL i),M_bool,0)
exprIR (M_cval i) st = ((I_CVAL i),M_char,0)
exprIR (M_size (str,n)) st = result where
    I_VARIABLE (level,offset,t,dims) = look_up_verify ST_VAR st str
    result = case n < dims of
        True -> (I_SIZE (level,offset,n+1),M_int,0)
        False -> error ("TypeError: '"++str++"' at dimension "++(show n)
                        ++" is not a valid input for function 'size'") 
exprIR (M_id (str,exprs)) st = result where -- this might be wrong, check this! (see above can you do?)
    I_VARIABLE (level,offset,t,dims) = look_up_verify ST_VAR st str
    indice_exprs = exprsIR exprs st
    all_ints = allInt $ map t_snd indice_exprs
    equal_dims = checkDims dims (length exprs)
    indices = map t_fst indice_exprs
    result = case all_ints of
                True -> case equal_dims of
                            True -> ((I_ID (level,offset,indices)),t,(length exprs))
                            False -> error ("TypeError: Incorrect dimensions for array '"++str++"':\n"
                                            ++"\tProvided dimensions: "++(show (length exprs))++"\n"
                                            ++"\tActual dimensions:   "++(show dims))
                False -> error "TypeError: All array dimensions must be of type 'int'"
exprIR (M_app (op,exprs)) st = (I_APP (op_ir,(map t_fst expr_irs)),t,dims) where
    expr_irs = exprsIR exprs st
    (op_ir, t, dims) = operationIR op st (map (\(a,b,c) -> (b,c)) expr_irs)

operationIR :: M_operation -> ST -> [(M_type, Int)] -> (I_opn, M_type, Int)
operationIR M_add st types = getOp2 M_add types [I_ADD_I,I_ADD_F] [M_int, M_real]
operationIR M_mul st types = getOp2 M_mul types [I_MUL_I,I_MUL_F] [M_int, M_real]
operationIR M_sub st types = getOp2 M_sub types [I_SUB_I,I_SUB_F] [M_int, M_real]
operationIR M_div st types = getOp2 M_div types [I_DIV_I,I_DIV_F] [M_int, M_real]
operationIR M_neg st types = getOp2 M_neg types [I_NEG_I,I_NEG_F] [M_int, M_real]
operationIR M_lt st types = getOp3 M_lt types [I_LT_I,I_LT_F,I_LT_C] [M_int, M_real, M_char]
operationIR M_le st types = getOp3 M_le types [I_LE_I,I_LE_F,I_LE_C] [M_int, M_real, M_char]
operationIR M_gt st types = getOp3 M_gt types [I_GT_I,I_GT_F,I_GT_C] [M_int, M_real, M_char]
operationIR M_ge st types = getOp3 M_ge types [I_GE_I,I_GE_F,I_GE_C] [M_int, M_real, M_char]
operationIR M_eq st types = getOp3 M_eq types [I_EQ_I,I_EQ_F,I_EQ_C] [M_int, M_real, M_char]
operationIR M_not st types = getOp1 M_not types [I_NOT] [M_bool]
operationIR M_and st types = getOp1 M_and types [I_AND] [M_bool]
operationIR M_or st types = getOp1 M_or types [I_OR] [M_bool]
operationIR M_float st types = result where
    t = sameTypes $ map fst types
    result = case t of
            Just M_int -> (I_FLOAT, M_real, 0)
            _ -> error $ argsError (printOp M_float) (map fst types) [M_int]
operationIR M_floor st types = result where
    t = sameTypes $ map fst types
    result = case t of
            Just M_real -> (I_FLOOR, M_int, 0)
            _ -> error $ argsError (printOp M_floor) (map fst types) [M_real]
operationIR M_ceil st types = result where
    t = sameTypes $ map fst types
    result = case t of
            Just M_real -> (I_CEIL, M_int, 0)
            _ -> error $ argsError (printOp M_ceil) (map fst types) [M_real]
operationIR (M_cid str) st types = result where
    I_CONSTRUCTOR (num,arg_types,type_str) = look_up_verify ST_CON st str
    result = case (map fst types) == arg_types of
                True -> (I_CONS (num, (length arg_types)), (M_type type_str), 0)
                False -> error ("TypeError: Incorrect arguments to constructor '"++str++"':\n"
                                ++"\tProvided arguments: ("++(intercalate ", " $ map printType $ map fst types)++")"++"\n"
                                ++"\tActual arguments:   ("++(intercalate ", " $ map printType arg_types)++")")
operationIR (M_fn str) st types = result where
    I_FUNCTION (level,label,argTypes,t) = look_up_verify ST_FUN st str
    result = case argTypes == types of
                True -> (I_CALL (label,level), t, 0)
                False -> error ("TypeError: Incorrect arguments to function '"++str++"':\n"
                                ++"\tProvided arguments: ("++(intercalate ", " $ map (\(tp,n) -> ("(Type: '"++(printType tp)++"', Dimensions: "++(show n)++")")) types)++")"++"\n"
                                ++"\tActual arguments:   ("++(intercalate ", " $ map (\(tp,n) -> ("(Type: '"++(printType tp)++"', Dimensions: "++(show n)++")")) argTypes)++")")

getOp1 :: M_operation -> [(M_type, Int)] -> [I_opn] -> [M_type] -> (I_opn, M_type, Int)
getOp1 op types possible_ops allowed = result where
    t = sameTypes $ map fst types
    result = case t of
            Just M_bool -> ((possible_ops !! 0), M_bool, 0)
            _ -> error $ opTypeError op allowed

getOp2 :: M_operation -> [(M_type, Int)] -> [I_opn] -> [M_type] -> (I_opn, M_type, Int)
getOp2 op types possible_ops allowed = result where
    t = sameTypes $ map fst types
    result = case t of
            Just M_int -> ((possible_ops !! 0), M_int, 0)
            Just M_real -> ((possible_ops !! 1), M_real, 0)
            _ -> error $ opTypeError op allowed

getOp3 :: M_operation -> [(M_type, Int)] -> [I_opn] -> [M_type] -> (I_opn, M_type, Int)
getOp3 op types possible_ops allowed = result where
    t = sameTypes $ map fst types
    result = case t of
            Just M_int -> ((possible_ops !! 0), M_bool, 0)
            Just M_real -> ((possible_ops !! 1), M_bool, 0)
            Just M_char -> ((possible_ops !! 2), M_bool, 0)
            _ -> error $ opTypeError op allowed

typesIR :: [M_type] -> ST -> [M_type]
typesIR types st = map (\t -> typeIR t st) types

typeIR :: M_type -> ST -> M_type
typeIR M_int st = M_int
typeIR (M_type str) st = t where
    I_TYPE cons = look_up_verify ST_TYPE st str
    t = case (length cons) > 0 of
            True -> M_type str
            _ -> error ("Type "++str++" not found!")
typeIR t st = t

isTypes :: [M_type] -> Bool
isTypes (t:ts) = case isType t of
                    True -> isTypes ts
                    _ -> False
isTypes [] = True

isType :: M_type -> Bool
isType M_int = True
isType M_bool = True
isType M_real = True
isType M_char = True
isType (M_type str) = True

equalType :: M_type -> M_type -> Bool
equalType t1 t2 
    | t1 == t2 = True
    | otherwise = error "LOLOLOL!"

opTypeError :: M_operation -> [M_type] -> String
opTypeError op allowed = error ("TypeError: All expressions supplied to '"
                                ++(printOp op)++"' must be of type "
                                ++(optionString allowed))

argsError :: String -> [M_type] -> [M_type] -> String
argsError id provided actual = ("TypeError: Incorrect arguments to function '"++id++"':\n"
                                ++"\tProvided arguments: ("++(intercalate ", " $ map printType provided)++")"++"\n"
                                ++"\tActual arguments:   ("++(intercalate ", " $ map printType actual)++")")

optionString :: [M_type] -> String
optionString options
    | (length options) > 1 = (intercalate ", " $ init types)++" or "++(last types)
    | otherwise = last types
        where
            types = map printType options

localVarCount :: ST -> Int
localVarCount ((Sym_tbl (_,n,_,_)):rest) = n

argsCount :: ST -> Int
argsCount ((Sym_tbl (_,_,n,_)):rest) = n

allInt :: [M_type] -> Bool
allInt (t:ts) = case t of
                  M_int -> allInt ts
                  _ -> False
allInt [] = True

sameTypes :: [M_type] -> Maybe M_type
sameTypes [] = Nothing
sameTypes (t:ts) = case all (== t) ts of
                    True -> Just t
                    False -> Nothing

checkDims :: Int -> Int -> Bool
checkDims n m 
    | n == m = True
    | otherwise = False

getLastOffset :: ST -> Int
getLastOffset ((Sym_tbl (_,_,_,(_,Var_attr (offset,_,_)):_)):_) = offset

getSymDesc :: M_decl -> SYM_DESC
getSymDesc (M_var (s, arraydims, t)) = VARIABLE (s, t, length arraydims)
getSymDesc (M_data (s, cons)) = DATATYPE (s, map fst cons)
--getSymDesc (M_fun (s, args, t, decls, _)) = FUNCTION (s, (reverse $ map (\(_,n,a_t) -> (a_t,n)) args), t)

t_fst :: (a,b,c) -> a
t_fst (a,_,_) = a

t_snd :: (a,b,c) -> b
t_snd (_,b,_) = b

t_trd :: (a,b,c) -> c
t_trd (_,_,c) = c

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
