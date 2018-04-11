module SymbolTable where 

import Prelude hiding (LT, GT)
import System.Environment
import System.IO
import Data.List hiding (insert)
import Parser
import Lexer

data SYM_DESC = ARGUMENT (String,M_type,Int)
              | VARIABLE (String,M_type,Int)
              | FUNCTION (String,[(M_type,Int)],M_type)
              | DATATYPE (String, [String])          -- Changed from DATATYPE String
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