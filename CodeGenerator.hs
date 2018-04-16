module CodeGenerator where

import Data.List
import SymbolTable

generateCode :: IR -> String
generateCode (I_PROG (funs,vars,array_descs,stmts)) = init $ prettifyLines $
    "LOAD_R %sp\n"++
    "LOAD_R %sp\n"++
    "STORE_R %fp\n"++
    "ALLOC "++(show vars)++"\n"++
    "LOAD_I "++(show (vars+1))++"\n"++
    (generateArrayDescs vars array_descs)++
    (generateStmts stmts)++
    "LOAD_R %fp\n"++
    "LOAD_O "++(show (vars+1))++"\n"++
    "APP NEG\n"++
    "ALLOC_S\n"++
    "HALT\n"++
    (generateFuns funs)++
    (generateStmtFuns stmts)

generateFuns :: [I_fbody] -> String
generateFuns funs = concat $ map generateFun funs

generateFun :: I_fbody -> String
generateFun (I_FUN (label,funs,vars,args,array_descs,stmts)) = 
    label++":LOAD_R %sp\n"++
    "STORE_R %fp\n"++
    "ALLOC "++(show vars)++"\n"++
    "LOAD_I "++(show (vars+2))++"\n"++
    (generateArrayDescs vars array_descs)++
    (generateStmts stmts)++
    (storeInto (0,-(args+3),[]))++
    (loadFrom (0,0,[]))++
    (storeInto (0,-(args+2),[]))++
    (loadFrom (0,(vars+1),[]))++
    "APP NEG\n"++
    "ALLOC_S\n"++
    "STORE_R %fp\n"++
    "ALLOC "++(show (-args))++"\n"++
    "JUMP_S\n"++
    (generateFuns funs)

generateStmtFuns :: [I_stmt] -> String
generateStmtFuns stmts = concat $ map generateStmtFun stmts

generateStmtFun :: I_stmt -> String
generateStmtFun (I_WHILE (_,stmt)) = generateStmtFun stmt
generateStmtFun (I_COND (_,s1,s2)) =
    (generateStmtFun s1)++
    (generateStmtFun s2)
generateStmtFun (I_CASE (_,cases)) =
    concat $ map (\(_,_,stmt) -> (generateStmtFun stmt)) cases
generateStmtFun (I_BLOCK (funs,_,_,stmts)) =
    (generateFuns funs)++
    (generateStmtFuns stmts)
generateStmtFun _ = ""

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

generateStmts :: [I_stmt] -> String
generateStmts stmts = foldr (++) "" $ map generateStmt stmts

generateStmt :: I_stmt -> String
generateStmt (I_BLOCK (funs,vars,array_descs,stmts)) =
    "LOAD_R %fp\n"++
    "ALLOC 2\n"++
    "LOAD_R %sp\n"++
    "STORE_R %fp\n"++
    "ALLOC "++(show vars)++"\n"++
    "LOAD_I "++(show (vars+3))++"\n"++
    (generateArrayDescs vars array_descs)++
    (generateStmts stmts)++
    "LOAD_R %fp\n"++
    "LOAD_O "++(show (vars+1))++"\n"++
    "APP NEG\n"++
    "ALLOC_S\n"++
    "STORE_R %fp\n"
generateStmt (I_ASS (level,offset,indices,expr)) =
    (generateExpr expr)++
    (storeInto (level,offset,indices))
generateStmt (I_RETURN expr) = generateExpr expr
generateStmt (I_READ_I (level,offset,indices)) =
    "READ_I\n"++
    (storeInto (level,offset,indices))
generateStmt (I_READ_F (level,offset,indices)) =
    "READ_F\n"++
    (storeInto (level,offset,indices))
generateStmt (I_READ_B (level,offset,indices)) =
    "READ_B\n"++
    (storeInto (level,offset,indices))
generateStmt (I_READ_C (level,offset,indices)) =
    "READ_C\n"++
    (storeInto (level,offset,indices))
generateStmt (I_PRINT_I expr) =
    (generateExpr expr)++
    "PRINT_I"++"\n"
generateStmt (I_PRINT_F expr) =
    (generateExpr expr)++
    "PRINT_F"++"\n"
generateStmt (I_PRINT_B expr) =
    (generateExpr expr)++
    "PRINT_B"++"\n"
generateStmt (I_PRINT_C expr) =
    (generateExpr expr)++
    "PRINT_C"++"\n"

generateExprs :: [I_expr] -> String
generateExprs exprs = concat $ map generateExpr exprs

generateExpr :: I_expr -> String
generateExpr (I_IVAL i) = "LOAD_I "++(show i)++"\n"
generateExpr (I_RVAL r) = "LOAD_F "++(show r)++"\n"
generateExpr (I_BVAL True) = "LOAD_B true\n"
generateExpr (I_BVAL False) = "LOAD_B false\n"
generateExpr (I_CVAL c) = "LOAD_C "++['"',c,'"']++"\n"
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

generateOp :: I_opn -> String
generateOp (I_CALL (label,level)) =
    "ALLOC 1\n"++
    "LOAD_R %fp\n"++
    (concat $ replicate level "LOAD_O -2\n")++
    "LOAD_R %fp\n"++
    "LOAD_R %cp\n"++
    "JUMP "++label++"\n"
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
                        Just n -> let (as,bs) = splitAt (n+1) line in as++"\t"++bs++"\n"
                        Nothing -> "\t\t"++line++"\n"