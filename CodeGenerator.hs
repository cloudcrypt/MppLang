module CodeGenerator where

import SymbolTable

generateCode :: IR -> String
generateCode (I_PROG (funs,vars,array_descs,stmts)) = 
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
    "HALT"

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
