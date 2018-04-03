module Main where 

import Prelude hiding (LT, GT)
import System.Environment
import System.IO
import Parser
import Lexer

data SYM_DESC = ARGUMENT (String,M_type,Int)
              | VARIABLE (String,M_type,Int)
              | FUNCTION (String,[(M_type,Int)],M_type)
              | DATATYPE String 
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
-- type DeclContainer = M_prog | M_decl

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

inIndexList :: String -> [(String,SYM_VALUE)] -> Bool
inIndexList str [] = False
inIndexList str ((x,_):xs)
    | str==x = True
    | otherwise = inIndexList str xs

--lookup:: ST -> string -> SYM_I_DESC
--lookup s x = find 0 s where
--  found level (Var_attr(offset,type,dim)) 
--                =  I_VARIABLE(level,offset,type,dim)
--  found level (Fun_attr(label,arg_Type,type)) 
--                = I_FUNCTION(level,label,arg_Type,type)
--  ...

--  find_level ((str,v):rest)|x== str = Just v
--                           |otherwise =  find_level rest
--  find_level [] = Nothing

--  find n [] = error ("Could not find "++ str)
--  find n (Sym_tbl(_,_,_,vs)::rest) = 
--         (case find_level vs of 
--          Just v -> found n v
--    Nothing -> find (n+1) rest)


--return:: ST -> M_type

generateST :: AST -> ST
generateST (M_prog (decls,stmts)) = generateDeclST to_insert st' where
    (to_insert, st) = insertDecls decls [] (newscope L_PROG empty)
    st' = insertStmts stmts st

generateBlockST :: M_stmt -> ST -> ST
generateBlockST (M_block (decls,stmts)) st = generateDeclST to_insert st'' where
    (to_insert, st') = insertDecls decls [] (newscope L_BLK st)
    st'' = insertStmts stmts st'

generateDeclST :: [M_decl] -> ST -> ST
generateDeclST ((M_fun (_,args,t,decls,stmts)):rest) st = generateDeclST rest' st''' where
  (rest', st') = insertDecls decls rest (newscope (L_FUN t) st)
  st'' = insertArgs (reverse $ map getArgDesc args) st'
  st''' = insertStmts stmts st''
generateDeclST (_:rest) st = generateDeclST rest st
generateDeclST [] st = st

insertDecls :: [M_decl] -> [M_decl] -> ST -> ([M_decl], ST)
insertDecls (d:ds) to_insert st = insertDecls ds (to_insert++[d]) st' where
  (n, st') = insert 0 st (getSymDesc d)
insertDecls [] to_insert st = (to_insert, st)

insertStmts :: [M_stmt] -> ST -> ST
insertStmts ((M_while (_,stmt)):rest) st = insertStmts (rest++[stmt]) st
insertStmts ((M_cond (_,stmt1,stmt2)):rest) st = insertStmts (rest++[stmt1,stmt2]) st
insertStmts ((M_block b):rest) st = insertStmts rest st' where
  st' = generateBlockST (M_block b) st
insertStmts (_:rest) st = insertStmts rest st
insertStmts [] st = st

insertArgs :: [SYM_DESC] -> ST -> ST
insertArgs (arg:args) st = insertArgs args st' where
  (n, st') = insert 0 st arg
insertArgs [] st = st

getSymDesc :: M_decl -> SYM_DESC
getSymDesc (M_var (s, arraydims, t)) = VARIABLE (s, t, length arraydims)
getSymDesc (M_fun (s, args, t, decls, _)) = FUNCTION (s, (reverse $ map (\(_,n,a_t) -> (a_t,n)) args), t)

getArgDesc :: (String,Int,M_type) -> SYM_DESC
getArgDesc (s,n,t) = ARGUMENT (s,t,n)

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

                    let st = generateST ast
                    print st

                _ -> printErrors (filter isError ts)
        _ -> do
            putStrLn "Usage: inputFilename"
