module CodeGenerator where

import SymbolTable

generateCode :: IR -> String
generateCode (I_PROG (funs,vars,array_descs,stmts)) = 
    "LOAD_R %sp\n"++
    "LOAD_R %sp\n"++
    "STORE_R %fp\n"++
    "ALLOC "++(show vars)++"\n"++
    "ALLOC "++(show (-vars))++"\n"++
    "HALT"
