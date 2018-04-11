module Main where

import System.Environment
import System.IO
import Lexer
import Parser
import SymbolTable
import IRGenerator

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

                    let c = newCounter
                    let ir = generateIR ast c
                    print ir

                    putStrLn $ printIR ir

                _ -> printErrors (filter isError ts)
        _ -> do
            putStrLn "Usage: inputFilename"