

-- Daniel Dastoor
module IRGenerator where 

import Prelude hiding (LT, GT)
import System.Environment
import System.IO
import Data.List hiding (insert, intersperse)
import Data.IORef
import System.IO.Unsafe
import Lexer
import Parser
import SymbolTable

generateIR :: (Num a, Show a) => AST -> IORef a -> IR
generateIR (M_prog (decls,stmts)) c = I_PROG (fun_irs,(localVarCount st'),array_descs,stmt_irs) where
    st = collectTypesIR decls (newscope L_PROG empty)
    (st', array_descs) = varsIR decls st c
    fun_irs = funsIR decls st' c
    stmt_irs = stmtsIR stmts st' c

collectTypesIR :: [M_decl] -> ST -> ST
collectTypesIR (d:ds) st = collectTypesIR ds st' where
    st' = collectTypeIR d st
collectTypesIR [] st = st

varsIR :: (Num a, Show a) => [M_decl] -> ST -> IORef a -> (ST, [Array_desc])
varsIR (d:ds) st c = (st'', array_descs++array_descs') where
    (st', array_descs) = varIR d st c
    (st'', array_descs') = varsIR ds st' c
varsIR [] st c = (st, [])

funsIR :: (Num a, Show a) => [M_decl] -> ST -> IORef a -> [I_fbody]
funsIR (d:ds) st c = (funIR d st c)++(funsIR ds st c)
funsIR [] st c = []

collectTypeIR :: M_decl -> ST -> ST
collectTypeIR (M_data (str,cons)) st = st'' where
    st' = insert 0 st (getSymDesc (M_data (str,cons)))
    st'' = consIR str cons st'
collectTypeIR _ st = st

consIR :: String -> [(String,[M_type])] -> ST -> ST
consIR datatype_name cons st = consIR' datatype_name cons st 0

consIR' :: String -> [(String,[M_type])] -> ST -> Int -> ST
consIR' datatype_name (con:cons) st n = consIR' datatype_name cons st' (n+1) where
    st' = conIR datatype_name con st n
consIR' _ [] st _ = st

conIR :: String -> (String,[M_type]) -> ST -> Int -> ST
conIR datatype_name (str,types) st n = st' where
    types_ir = typesIR types st
    st' = case isTypes types_ir of
                True -> insert n st (CONSTRUCTOR (str,types_ir,datatype_name))
                _ -> error "bbbb!"

varIR :: (Num a, Show a) => M_decl -> ST -> IORef a -> (ST, [Array_desc])
varIR f@(M_fun (str,args,t,decls,stmts)) st c = (st', []) where
    st' = insertFun c st (getSymDesc f)
varIR v@(M_var (str,exprs,t)) st _ = result where
    dim_exprs = exprsIR exprs $ tail st
    all_ints = allInt $ map t_snd dim_exprs
    type_ir = typeIR t st
    st' = case isType type_ir of
                True -> insert 0 st (getSymDesc v)
                _ -> error "aaaaa!"
    dims = map t_fst dim_exprs
    array_desc = case (length dims) > 0 of
                    True -> [((getLastOffset st'),dims)]
                    False -> []
    result = case all_ints of
                True -> (st', array_desc)
                False -> error "TypeError: All array dimensions must be of type 'int'"
varIR _ st _ = (st, [])

funIR :: (Num a, Show a) => M_decl -> ST -> IORef a -> [I_fbody]
funIR (M_fun (str,args,t,decls,stmts)) st c = result where
    st' = collectArgs (reverse args) (newscope (L_FUN t) st)
    st'' = collectTypesIR decls st'
    (st''', array_descs) = varsIR decls st'' c
    fun_irs = funsIR decls st''' c
    stmt_irs = stmtsIR stmts st''' c
    M_return return_expr = last stmts
    I_FUNCTION (_,label,_,_) = look_up_verify ST_FUN st str
    result = let pt = (t_snd (exprIR return_expr st''')) in case pt == t of
                True -> [I_FUN (label,fun_irs,(localVarCount st'''),(argsCount st'),array_descs,stmt_irs)]
                _ -> error ("TypeError: Return type mismatch for function '"++str++"'\n"
                            ++"\tProvided return type: '"++(printType pt)++"'\n"
                            ++"\tActual return type:   '"++(printType t)++"'")
funIR _ st c = []

collectArgs :: [(String,Int,M_type)] -> ST -> ST
collectArgs (arg:args) st = collectArgs args st' where
    st' = collectArg arg st
collectArgs [] st = st 

collectArg :: (String,Int,M_type) -> ST -> ST
collectArg (str,dim,t) st = result where
    type_ir = typeIR t st
    result = case isType type_ir of
                True -> insert 0 st (ARGUMENT (str,t,dim))
                _ -> error "An unexpected error has occured (collectArg)"

stmtsIR :: (Num a, Show a) => [M_stmt] -> ST -> IORef a -> [I_stmt]
stmtsIR stmts st c = map (\s -> stmtIR s st c) stmts

stmtIR :: (Num a, Show a) => M_stmt -> ST -> IORef a -> I_stmt
stmtIR (M_ass (str, exprs, expr)) st _ = result where
    ((I_ID (level,offset,indices)),t1,_) = exprIR (M_id (str,exprs)) st
    (expr_ir,t2,_) = exprIR expr st
    result = case t1 == t2 of
                True -> I_ASS (level,offset,indices,expr_ir)
                _ -> error ("TypeError: Type mismatch in assignment:\n"
                            ++"\tType of '"++str++"' is '"++(printType t1)
                            ++"', but type of expression is '"++(printType t2)++"'")
stmtIR (M_while (expr, stmt)) st c = result where
    (expr_ir,t,_) = exprIR expr st
    stmt_ir = stmtIR stmt st c
    result = case t of
                M_bool -> I_WHILE (expr_ir,stmt_ir)
                _ -> error ("TypeError: While statement expression must be of type "++(printType M_bool))
stmtIR (M_cond (expr,s1,s2)) st c = result where
    (expr_ir,t,_) = exprIR expr st
    s1_ir = stmtIR s1 st c
    s2_ir = stmtIR s2 st c
    result = case t of
                M_bool -> I_COND (expr_ir,s1_ir,s2_ir)
                _ -> error ("TypeError: If statement expression must be of type "++(printType M_bool))
stmtIR (M_read (str,exprs)) st _ = result where
    ((I_ID (level,offset,indices)),t,_) = exprIR (M_id (str,exprs)) st
    result = case t of
                M_int -> I_READ_I (level,offset,indices)
                M_bool -> I_READ_B (level,offset,indices)
                M_real -> I_READ_F (level,offset,indices)
                M_char -> I_READ_C (level,offset,indices)
                _ -> error ("TypeError: Wrong type '"++(printType t)++"' supplied to read")
stmtIR (M_print expr) st _ = let (expr_ir, t, _) = exprIR expr st in
                             case t of
                               M_int -> I_PRINT_I expr_ir
                               M_bool -> I_PRINT_B expr_ir
                               M_real -> I_PRINT_F expr_ir
                               M_char -> I_PRINT_C expr_ir
                               _ -> error ("TypeError: Wrong type '"++(printType t)++"' supplied to print")
stmtIR (M_return expr) st _ = I_RETURN (t_fst $ exprIR expr st)
stmtIR (M_block (decls,stmts)) st c = I_BLOCK (fun_irs,(localVarCount st''),array_descs,stmt_irs) where
    st' = collectTypesIR decls (newscope L_BLK st)
    (st'', array_descs) = varsIR decls st' c
    fun_irs = funsIR decls st'' c
    stmt_irs = stmtsIR stmts st'' c
stmtIR (M_case (expr,cases)) st c = I_CASE (expr_ir,cases_ir) where
    (expr_ir,t) = case exprIR expr st of
                        (e_ir,(M_type str),0) -> (e_ir,(M_type str))
                        _ -> error "TypeError: Case statements can only match on expressions of a valid datatype"
    cases_ir = casesIR cases t st c

casesIR :: (Num a, Show a) => [(String,[String],M_stmt)] -> M_type -> ST -> IORef a -> [(Int,Int,I_stmt)]
casesIR cases t st cntr = map (\c -> caseIR c t st cntr) cases

caseIR :: (Num a, Show a) => (String,[String],M_stmt) -> M_type -> ST -> IORef a -> (Int,Int,I_stmt)
caseIR (str,args,stmt) t st c = result where
    I_CONSTRUCTOR (num,arg_types,type_str) = look_up_verify ST_CON st str
    (st',_) = varsIR (map (\a -> (M_var (fst a,[],snd a))) $ zip args arg_types) (newscope L_CASE st) c
    stmt_ir = stmtIR stmt st' c
    result = case (length arg_types) == (length args) of
                True -> case t == (M_type type_str) of
                            True -> (num,(length arg_types),stmt_ir)
                            False -> error ("TypeError: Case constructors must match datatype of case expression:\n"
                                            ++"\tProvided datatype: '"++(printType (M_type type_str))++"'\n"
                                            ++"\tActual datatype:   '"++(printType t)++"'")
                False -> error ("TypeError: Incorrect number of arguments to constructor '"++str++"':\n"
                                ++"\tProvided arguments: "++(show $ length args)++"\n"
                                ++"\tActual arguments:   "++(show $ length arg_types))

exprsIR :: [M_expr] -> ST -> [(I_expr,M_type,Int)]
exprsIR exprs st = map (\e -> exprIR e st) exprs

argExprsIR :: [M_expr] -> ST -> [(I_expr,M_type,Int)]
argExprsIR ((M_id e):es) st = (refIR (M_id e) st):(argExprsIR es st)
argExprsIR (e:es) st = (exprIR e st):(argExprsIR es st)
argExprsIR [] st = []

refIR :: M_expr -> ST -> (I_expr,M_type,Int)
refIR (M_id (str,exprs)) st = result where
    I_VARIABLE (level,offset,t,dims) = look_up_verify ST_VAR st str
    result = case (length exprs) > 0 of
                False -> case dims > 0 of
                            True -> (I_REF (level,offset),t,dims)
                            False -> (I_ID (level,offset,[]),t,0)
                True -> error "invalid array thing to function call!"

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
exprIR (M_id (str,exprs)) st = result where
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
    expr_irs = case op of
                M_fn _ -> argExprsIR exprs st
                _ -> exprsIR exprs st
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
    result = let revArgTypes = (reverse argTypes) in case revArgTypes == types of
                True -> (I_CALL (label,level), t, 0)
                False -> error ("TypeError: Incorrect arguments to function '"++str++"':\n"
                                ++"\tProvided arguments: ("++(intercalate ", " $ map (\(tp,n) -> ("(Type: '"++(printType tp)++"', Dimensions: "++(show n)++")")) types)++")"++"\n"
                                ++"\tActual arguments:   ("++(intercalate ", " $ map (\(tp,n) -> ("(Type: '"++(printType tp)++"', Dimensions: "++(show n)++")")) revArgTypes)++")")

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
getSymDesc (M_fun (s, args, t, decls, _)) = FUNCTION (s, (reverse $ map (\(_,n,a_t) -> (a_t,n)) args), t)

t_fst :: (a,b,c) -> a
t_fst (a,_,_) = a

t_snd :: (a,b,c) -> b
t_snd (_,b,_) = b

t_trd :: (a,b,c) -> c
t_trd (_,_,c) = c

printIR :: I_prog -> String
printIR (I_PROG (funs,vars,array_descs,stmts)) = "I_PROG (\n"
                                                  ++"\t "++(printList funs printFbodyIr)++"\n"
                                                  ++"\t,"++(show vars)++"\n"
                                                  ++"\t,"++(printList array_descs show)++"\n"
                                                  ++"\t,"++(printList stmts printStmtIr)++")"

printFbodyIr :: I_fbody -> String
printFbodyIr (I_FUN (str,funs,vars,args,array_descs,stmts)) = "I_PROG (\n"
                                                           ++"\t "++str++"\n"
                                                           ++"\t,"++(printList funs printFbodyIr)++"\n"
                                                           ++"\t,"++(show vars)++"\n"
                                                           ++"\t,"++(show args)++"\n"
                                                           ++"\t,"++(printList array_descs show)++"\n"
                                                           ++"\t,"++(printList stmts printStmtIr)++")"

printStmtIr :: I_stmt -> String
printStmtIr (I_WHILE (expr, stmt)) = "I_WHILE (\n"
                                      ++"\t "++(show expr)++"\n"
                                      ++"\t,"++(intersperse "\t" $ printStmtIr stmt)++")"
printStmtIr (I_COND (expr,s1,s2)) = "I_COND (\n"
                                      ++"\t "++(show expr)++"\n"
                                      ++"\t,"++(printStmtIr s1)
                                      ++"\t,"++(printStmtIr s2)++")"
printStmtIr (I_CASE (expr,cases)) = "I_CASE (\n"
                                      ++"\t "++(show expr)++"\n"
                                      ++"\t,"++(printList cases printCaseIr)++")"
printStmtIr (I_BLOCK (funs,vars,array_descs,stmts)) = "I_BLOCK (\n"
                                                       ++"\t []"++"\n"
                                                       ++"\t,"++(show vars)++"\n"
                                                       ++"\t,"++(printList array_descs show)++"\n"
                                                       ++"\t,"++(printList stmts printStmtIr)++")"
printStmtIr a = show a

printCaseIr :: (Int,Int,I_stmt) -> String
printCaseIr (n,m,stmt) = "("++(show n)++"\n"
                          ++","++(show m)++"\n"
                          ++","++(printStmtIr stmt)++")"

printList :: [a] -> (a -> String) -> String
printList list f = "["++(intercalate "\n\t  ," $ map (intersperse "\t  ") $ map f list)++"]"