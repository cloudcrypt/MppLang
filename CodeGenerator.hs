module CodeGenerator where

import Data.List
import Data.IORef
import SymbolTable

generateCode :: (Num a, Show a) => IR -> IORef a -> String
generateCode (I_PROG (funs,vars,array_descs,stmts)) c = init $ prettifyLines $
    "LOAD_R %sp\n"++
    "LOAD_R %sp\n"++
    "STORE_R %fp\n"++
    "ALLOC "++(show vars)++"\n"++
    "LOAD_I "++(show (vars+1))++"\n"++
    (generateArrayDescs vars array_descs)++
    (generateStmts stmts c)++
    "LOAD_R %fp\n"++
    "LOAD_O "++(show (vars+1))++"\n"++
    "APP NEG\n"++
    "ALLOC_S\n"++
    "HALT\n"++
    (generateFuns funs c)++
    (generateStmtFuns stmts c)

generateFuns :: (Num a, Show a) => [I_fbody] -> IORef a -> String
generateFuns funs c = concat $ map (generateFun c) funs

generateFun :: (Num a, Show a) => IORef a -> I_fbody -> String
generateFun c (I_FUN (label,funs,vars,args,array_descs,stmts)) = 
    label++":LOAD_R %sp\n"++
    "STORE_R %fp\n"++
    "ALLOC "++(show vars)++"\n"++
    "LOAD_I "++(show (vars+2))++"\n"++
    (generateArrayDescs vars array_descs)++
    (generateStmts stmts c)++
    (storeInto (0,-(args+3),[]))++
    (loadFrom (0,0,[]))++
    (storeInto (0,-(args+2),[]))++
    (loadFrom (0,(vars+1),[]))++
    "APP NEG\n"++
    "ALLOC_S\n"++
    "STORE_R %fp\n"++
    "ALLOC "++(show (-args))++"\n"++
    "JUMP_S\n"++
    (generateFuns funs c)++
    (generateStmtFuns stmts c)

generateStmtFuns :: (Num a, Show a) => [I_stmt] -> IORef a -> String
generateStmtFuns stmts c = concat $ map (generateStmtFun c) stmts

generateStmtFun :: (Num a, Show a) => IORef a -> I_stmt -> String
generateStmtFun c (I_WHILE (_,stmt)) = generateStmtFun c stmt
generateStmtFun c (I_COND (_,s1,s2)) =
    (generateStmtFun c s1)++
    (generateStmtFun c s2)
generateStmtFun c (I_CASE (_,cases)) =
    concat $ map (\(_,_,stmt) -> (generateStmtFun c stmt)) cases
generateStmtFun c (I_BLOCK (funs,_,_,stmts)) =
    (generateFuns funs c)++
    (generateStmtFuns stmts c)
generateStmtFun _ _ = ""

generateArrayDescs :: Int -> [(Int,[I_expr])] -> String
generateArrayDescs vars descs = foldr (++) "" $ map (generateArrayDesc vars) descs

generateArrayDesc :: Int -> (Int,[I_expr]) -> String
generateArrayDesc vars (offset,exprs) = 
    (generateExpr $ head exprs)++
    "LOAD_R %sp\n"++
    (storeInto (0,offset,[]))++
    (concat $ map generateExpr $ tail exprs)++
    (concat $ map (loadDimension offset) [0..((length exprs)-1)])++
    (concat $ replicate ((length exprs)-1) "APP MUL\n")++
    "LOAD_R %fp\n"++
    "LOAD_O "++(show (vars+1))++"\n"++
    "LOAD_I "++(show $ length exprs)++"\n"++
    "LOAD_R %fp\n"++
    "LOAD_O "++(show offset)++"\n"++
    "LOAD_O "++(show $ length exprs)++"\n"++
    "APP ADD\n"++
    "APP ADD\n"++
    (storeInto (0,(vars+1),[]))++
    "ALLOC_S\n"

loadDimension :: Int -> Int -> String
loadDimension offset n = 
    "LOAD_R %fp\n"++
    "LOAD_O "++(show offset)++"\n"++
    "LOAD_O "++(show n)++"\n"

generateCases :: (Num a, Show a) => [(Int,Int,I_stmt)] -> IORef a -> a -> String
generateCases cases c cInt = concat $ map (generateCase c cInt) cases

generateCase :: (Num a, Show a) => IORef a -> a -> (Int,Int,I_stmt) -> String
generateCase c cInt (con,args,stmt) = 
    "c"++(show cInt)++"_"++(show con)++":"++
    (generateStmt c stmt)++
    "ALLOC "++(show (-(args+2)))++"\n"++
    "JUMP c"++(show cInt)++"_end\n"

generateStmts :: (Num a, Show a) => [I_stmt] -> IORef a -> String
generateStmts stmts c = foldr (++) "" $ map (generateStmt c) stmts

generateStmt :: (Num a, Show a) => IORef a -> I_stmt -> String
generateStmt c (I_CASE (e,cases)) =
    (generateExpr e)++
    "LOAD_R %fp\n"++
    "ALLOC 2\n"++
    "LOAD_R %sp\n"++
    "STORE_R %fp\n"++
    (loadFrom (0,-3,[]))++
    "LOAD_H\n"++
    "JUMP_O\n"++
    (concat $ map (\(n,_,_) -> ("JUMP c"++(show cInt)++"_"++(show n)++"\n")) sortedCases)++
    (generateCases sortedCases c cInt)++
    "c"++(show cInt)++"_end:"++
    "STORE_R %fp\n"++
    "ALLOC -1\n"
    where
        cInt = getNextInt c
        sortedCases = sortBy (\(a,_,_) (b,_,_) -> compare a b) cases
generateStmt c (I_WHILE (expr,stmt)) =
    label0++":"++
    (generateExpr expr)++
    "JUMP_C "++label1++"\n"++
    (generateStmt c stmt)++
    "JUMP "++label0++"\n"++
    label1++":"
    where
        label0 = getNextCodeLabel c
        label1 = getNextCodeLabel c
generateStmt c (I_COND (e,s1,s2)) =
    (generateExpr e)++
    "JUMP_C "++label0++"\n"++
    (generateStmt c s1)++
    "JUMP "++label1++"\n"++
    label0++":"++(generateStmt c s2)++
    label1++":"
    where
        label0 = getNextCodeLabel c
        label1 = getNextCodeLabel c
generateStmt c (I_BLOCK (funs,vars,array_descs,stmts)) =
    "LOAD_R %fp\n"++
    "ALLOC 2\n"++
    "LOAD_R %sp\n"++
    "STORE_R %fp\n"++
    "ALLOC "++(show vars)++"\n"++
    "LOAD_I "++(show (vars+3))++"\n"++
    (generateArrayDescs vars array_descs)++
    (generateStmts stmts c)++
    "LOAD_R %fp\n"++
    "LOAD_O "++(show (vars+1))++"\n"++
    "APP NEG\n"++
    "ALLOC_S\n"++
    "STORE_R %fp\n"
generateStmt _ (I_ASS (level,offset,indices,expr)) =
    (generateExpr expr)++
    (storeInto (level,offset,indices))
generateStmt _ (I_RETURN expr) = generateExpr expr
generateStmt _ (I_READ_I (level,offset,indices)) =
    "READ_I\n"++
    (storeInto (level,offset,indices))
generateStmt _ (I_READ_F (level,offset,indices)) =
    "READ_F\n"++
    (storeInto (level,offset,indices))
generateStmt _ (I_READ_B (level,offset,indices)) =
    "READ_B\n"++
    (storeInto (level,offset,indices))
generateStmt _ (I_READ_C (level,offset,indices)) =
    "READ_C\n"++
    (storeInto (level,offset,indices))
generateStmt _ (I_PRINT_I expr) =
    (generateExpr expr)++
    "PRINT_I"++"\n"
generateStmt _ (I_PRINT_F expr) =
    (generateExpr expr)++
    "PRINT_F"++"\n"
generateStmt _ (I_PRINT_B expr) =
    (generateExpr expr)++
    "PRINT_B"++"\n"
generateStmt _ (I_PRINT_C expr) =
    (generateExpr expr)++
    "PRINT_C"++"\n"

generateExprs :: [I_expr] -> String
generateExprs exprs = concat $ map generateExpr exprs

generateExpr :: I_expr -> String
generateExpr (I_IVAL i) = "LOAD_I "++(show i)++"\n"
generateExpr (I_RVAL r) = "LOAD_F "++(show r)++"\n"
generateExpr (I_BVAL True) = "LOAD_B true\n"
generateExpr (I_BVAL False) = "LOAD_B false\n"
generateExpr (I_CVAL c) = "LOAD_C "++(show [c])++"\n"
generateExpr (I_ID (level,offset,[])) =
    "LOAD_R %fp\n"++
    (concat $ replicate level "LOAD_O -2\n")++
    "LOAD_O "++(show offset)++"\n"
generateExpr (I_ID (level,offset,indices)) =
    "LOAD_R %fp\n"++
    (concat $ replicate level "LOAD_O -2\n")++
    "LOAD_O "++(show offset)++"\n"++
    (concat $ map (processIndice (level,offset,(length indices))) (if (length indices) > 1 then (zip [1..(length $ init indices)] (init indices)) else []))++
    (generateExpr $ last indices)++
    "LOAD_I "++(show $ length indices)++"\n"++
    (concat $ replicate (length indices) "APP ADD\n")++
    "LOAD_OS\n"
generateExpr (I_APP (op,exprs)) =
    (generateExprs exprs)++
    (generateOp op)
generateExpr (I_REF (level,offset)) = loadFrom (level,offset,[])
generateExpr (I_SIZE (level,offset,dim)) = generateDimSize (level,offset) dim

generateOp :: I_opn -> String
generateOp (I_CALL (label,level)) =
    "ALLOC 1\n"++
    "LOAD_R %fp\n"++
    (concat $ replicate level "LOAD_O -2\n")++
    "LOAD_R %fp\n"++
    "LOAD_R %cp\n"++
    "JUMP "++label++"\n"
generateOp (I_CONS (con,args)) = 
    "LOAD_I "++(show con)++"\n"++
    "STORE_H "++(show (args+1))++"\n"
generateOp I_ADD_I = "APP ADD\n"
generateOp I_ADD_F = "APP ADD_F\n"
generateOp I_MUL_I = "APP MUL\n"
generateOp I_MUL_F = "APP MUL_F\n"
generateOp I_SUB_I = "APP SUB\n"
generateOp I_SUB_F = "APP SUB_F\n"
generateOp I_DIV_I = "APP DIV\n"
generateOp I_DIV_F = "APP DIV_F\n"
generateOp I_NEG_I = "APP NEG\n"
generateOp I_NEG_F = "APP NEG_F\n"
generateOp I_FLOAT = "APP FLOAT\n"
generateOp I_FLOOR = "APP FLOOR\n"
generateOp I_CEIL = "APP CEIL\n"
generateOp I_NOT = "APP NOT\n"
generateOp I_AND = "APP AND\n"
generateOp I_OR = "APP OR\n"
generateOp I_LT_I = "APP LT\n"
generateOp I_LE_I = "APP LE\n"
generateOp I_GT_I = "APP GT\n"
generateOp I_GE_I = "APP GE\n"
generateOp I_EQ_I = "APP EQ\n"
generateOp I_LT_F = "APP LT_F\n"
generateOp I_LE_F = "APP LE_F\n"
generateOp I_GT_F = "APP GT_F\n"
generateOp I_GE_F = "APP GE_F\n"
generateOp I_EQ_F = "APP EQ_F\n"
generateOp I_LT_C = "APP LT_C\n"
generateOp I_LE_C = "APP LE_C\n"
generateOp I_GT_C = "APP GT_C\n"
generateOp I_GE_C = "APP GE_C\n"
generateOp I_EQ_C = "APP EQ_C\n"

loadFrom :: (Int,Int,[I_expr]) -> String
loadFrom (level,offset,[]) =
    "LOAD_R %fp\n"++
    (concat $ replicate level "LOAD_O -2\n")++
    "LOAD_O "++(show offset)++"\n"

storeInto :: (Int,Int,[I_expr]) -> String
storeInto (level,offset,[]) =
    "LOAD_R %fp\n"++
    (concat $ replicate level "LOAD_O -2\n")++
    "STORE_O "++(show offset)++"\n"
storeInto (level,offset,indices) =
    "LOAD_R %fp\n"++
    (concat $ replicate level "LOAD_O -2\n")++
    "LOAD_O "++(show offset)++"\n"++
    (concat $ map (processIndice (level,offset,(length indices))) (if (length indices) > 1 then (zip [1..(length $ init indices)] (init indices)) else []))++
    (generateExpr $ last indices)++
    "LOAD_I "++(show $ length indices)++"\n"++
    (concat $ replicate (length indices) "APP ADD\n")++
    "STORE_OS\n"

processIndice :: (Int,Int,Int) -> (Int,I_expr) -> String
processIndice (level,offset,max) (n,expr) = 
    (generateExpr expr)++(generateMul (level,offset) [(n+1)..max])++"APP MUL\n"

generateMul :: (Int,Int) -> [Int] -> String
generateMul (level,offset) dims =
    (concat $ map (generateDimSize (level,offset)) dims)++
    (concat $ replicate ((length dims)-1) "APP MUL\n")

generateDimSize :: (Int,Int) -> Int -> String
generateDimSize (level,offset) n =
    "LOAD_R %fp\n"++
    (concat $ replicate level "LOAD_O -2\n")++
    "LOAD_O "++(show offset)++"\n"++
    "LOAD_O "++(show (n-1))++"\n"

prettifyLines :: String -> String
prettifyLines str = concat $ map prettifyLine $ lines str

prettifyLine :: String -> String
prettifyLine line = case (findIndex (==':') line) of
                        Just n -> let (as,bs) = splitAt (n+1) line in as++
                                                (if (length as) < 4 then "\t\t" else "\t")++
                                                bs++"\n"
                        Nothing -> "\t\t"++line++"\n"