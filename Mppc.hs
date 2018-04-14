

-- Daniel Dastoor
module Main where

import System.Environment
import System.IO
import Lexer
import Parser
import SymbolTable
import IRGenerator
import CodeGenerator

main :: IO ()
main = do
    args <- getArgs
    -- Check if proper number of args were supplied
    case (length args) of
        3 -> do
            -- Check if second arg is properly formatted
            case (args !! 1) of
                "-o" -> do
                    -- Perform lexing and get tokens
                    ts <- lexer (head args)
                    -- | Check if there are any errors in the list of tokens
                    case (length (filter isError ts)) of
                        0 -> do
                            -- Recognize grammar, and build abstract syntax tree
                            let ast = parse ts
                            -- Print syntax tree (converted back to readable code)
                            putStr "\nParsed Syntax Tree:\n\n"
                            putStrLn $ printAST ast

                            putStrLn ""

                            let c = newCounter
                            let ir = generateIR ast c

                            putStr "\nIntermediate Representation:\n\n"
                            putStrLn $ printIR ir

                            -- Write generated stack machine code to output file
                            writeFile (args !! 2) $ generateCode ir

                        _ -> printErrors (filter isError ts)
                _ -> putStrLn "Usage: inputFilename -o outputFilename"
        _ -> do
            putStrLn "Usage: inputFilename -o outputFilename"