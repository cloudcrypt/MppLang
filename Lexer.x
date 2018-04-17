

-- Daniel Dastoor
{
module Lexer where

import Prelude hiding (LT, GT)
import Data.List
import Data.Char
import System.Environment
}

%wrapper "posn"

--$digit = 0-9
--$alpha = [a-zA-Z]

$alpha = [a-zA-Z]
$digit = [0-9]
$quote = ["]
$char = [\^_A-Za-z0-9]

tokens :-
  $white+			      ; 
  "%" .* 			      ;
  "/*"				      {\p s -> LCOMMENT p}
  "*/"				      {\p s -> RCOMMENT p}
  "+"               {\p s -> ADD p}
  "-"               {\p s -> SUB p}
  "*"               {\p s -> MUL p}
  "/"               {\p s -> DIV p}
  "=>"              {\p s -> ARROW p}
  "&&"              {\p s -> AND p}
  "||"              {\p s -> OR p}
  "not"             {\p s -> NOT p}
  "="               {\p s -> EQUAL p}
  "<"               {\p s -> LT p}
  ">"               {\p s -> GT p}
  "=<"              {\p s -> LE p}
  ">="              {\p s -> GE p}
  ":="              {\p s -> ASSIGN p}
  "("               {\p s -> LPAR p}
  ")"               {\p s -> RPAR p}
  "{"               {\p s -> CLPAR p}
  "}"               {\p s -> CRPAR p}
  "["               {\p s -> SLPAR p}
  "]"               {\p s -> SRPAR p}
  "|"               {\p s -> SLASH p}
  ":"               {\p s -> COLON p}
  ";"               {\p s -> SEMICOLON p}
  ","               {\p s -> COMMA p} 
  "if"				      {\p s -> IF p}
  "then"            {\p s -> THEN p}
  "while"           {\p s -> WHILE p}
  "do"              {\p s -> DO p}
  "read"            {\p s -> READ p}
  "else"            {\p s -> ELSE p}
  "begin"           {\p s -> BEGIN p}
  "end"             {\p s -> END p}
  "case"            {\p s -> CASE p}
  "of"              {\p s -> OF p}
  "print"           {\p s -> PRINT p}
  "int"             {\p s -> INT p}
  "bool"            {\p s -> BOOL p}
  "char"            {\p s -> CHAR p}
  "real"            {\p s -> REAL p}
  "var"             {\p s -> VAR p}
  "data"            {\p s -> DATA p}
  "size"            {\p s -> SIZE p}
  "float"           {\p s -> FLOAT p}
  "floor"           {\p s -> FLOOR p}
  "ceil"            {\p s -> CEIL p}
  "fun"             {\p s -> FUN p}
  "return"          {\p s -> RETURN p}
  "#"[_$digit$alpha]*     {\p s -> CID p s}
  $digit+"."$digit+       {\p s -> RVAL p (read s :: Float)}
  $digit+                 {\p s -> IVAL p (read s :: Int)}
  "false"                 {\p s -> BVAL p (toBool s)}
  "true"                  {\p s -> BVAL p (toBool s)}
  $alpha[_$digit$alpha]*  {\p s -> ID p s}
  $quote$char$quote       {\p s -> CVAL p (s !! 1)}
  $quote$white$quote      {\p s -> CVAL p ' '}
  $quote"\n"$quote        {\p s -> CVAL p '\n'}
  $quote"\t"$quote        {\p s -> CVAL p '\t'}
  .				                {\p s -> ERROR p s}

{

toBool :: String -> Bool
toBool "false" = False
toBool "true" = True

{-|
    Parses the comment tokens in a list of tokens.
    Checks that the left and right comments are properly matched,
    and discards all tokens in properly commented regions.
-}
comment :: [Token] -> Int -> [Token]
comment (LCOMMENT p:ts) n = comment ts (n + 1)
comment (RCOMMENT p:ts) 0 = [(ERROR p "SyntaxError: Invalid comment close symbol")]
comment (RCOMMENT p:ts) n = comment ts (n - 1)
comment (t:ts) 0 = t:(comment ts 0)
comment (t:ts) n = comment ts n
comment [] 0 = []
comment [] _ = [(ERROR (AlexPn (-1) (-1) (-1)) "SyntaxError: Missing comment close symbol")]

data Token
  = ADD { pos :: AlexPosn }
  | SUB { pos :: AlexPosn }
  | MUL { pos :: AlexPosn }
  | DIV { pos :: AlexPosn }
  | ARROW { pos :: AlexPosn }
  | AND   { pos :: AlexPosn }
  | OR    { pos :: AlexPosn }
  | NOT   { pos :: AlexPosn }
  | EQUAL { pos :: AlexPosn }
  | LT    { pos :: AlexPosn }
  | GT    { pos :: AlexPosn }
  | LE    { pos :: AlexPosn }
  | GE    { pos :: AlexPosn }
  | ASSIGN  { pos :: AlexPosn }
  | LPAR { pos :: AlexPosn }
  | RPAR { pos :: AlexPosn }
  | CLPAR { pos :: AlexPosn }
  | CRPAR { pos :: AlexPosn }
  | SLPAR { pos :: AlexPosn }
  | SRPAR { pos :: AlexPosn }
  | SLASH { pos :: AlexPosn }
  | COLON { pos :: AlexPosn }
  | SEMICOLON { pos :: AlexPosn }
  | COMMA { pos :: AlexPosn }
  | IF { pos :: AlexPosn }
  | THEN { pos :: AlexPosn }
  | WHILE { pos :: AlexPosn }
  | DO { pos :: AlexPosn }
  | READ { pos :: AlexPosn }
  | ELSE { pos :: AlexPosn }
  | BEGIN { pos :: AlexPosn }
  | END { pos :: AlexPosn }
  | CASE { pos :: AlexPosn }
  | OF { pos :: AlexPosn }
  | PRINT { pos :: AlexPosn }
  | INT { pos :: AlexPosn }
  | BOOL { pos :: AlexPosn }
  | CHAR { pos :: AlexPosn }
  | REAL { pos :: AlexPosn }
  | VAR { pos :: AlexPosn }
  | DATA { pos :: AlexPosn }
  | SIZE { pos :: AlexPosn }
  | FLOAT { pos :: AlexPosn }
  | FLOOR { pos :: AlexPosn }
  | CEIL { pos :: AlexPosn }
  | FUN { pos :: AlexPosn }
  | RETURN { pos :: AlexPosn }
  | CID { pos :: AlexPosn, str :: String }
  | ID { pos :: AlexPosn, str :: String }
  | RVAL { pos :: AlexPosn, f :: Float }
  | IVAL { pos :: AlexPosn, i :: Int }
  | BVAL { pos :: AlexPosn, b :: Bool }
  | CVAL { pos :: AlexPosn, c :: Char }
  | LCOMMENT { pos :: AlexPosn }
  | RCOMMENT { pos :: AlexPosn }
  | ERROR { pos :: AlexPosn, str :: String }
  deriving (Eq, Show)

-- instance Show AlexPosn where
--   show (AlexPn off line col) = "line " ++ (show line) ++ ", column " ++ (show col)

-- | Returns true if a token is an ERROR token, false otherwise
isError :: Token -> Bool
isError (ERROR p s) = True
isError _ = False

-- | Prints all errors in a list of tokens using printError
printErrors :: [Token] -> IO ()
printErrors ts = mapM_ printError ts

-- | Prints an error, displaying its string or message, line number, and column number
printError :: Token -> IO ()
printError (ERROR (AlexPn (-1) (-1) (-1)) s) = do
    putStr (s ++ "\n")
printError (ERROR (AlexPn off line col) s) = do
    putStr (s ++ "\n\tError at line " ++ (show line) ++ ", column " ++ (show col) ++ "\n")

posStr :: AlexPosn -> String
posStr (AlexPn off line col) = "line " ++ (show line) ++ ", column " ++ (show col)

errorString :: AlexPosn -> String -> String
errorString p s = s++"\n\t\tat "++(posStr p)++"\n"

-- | Lexes the contents of a file into a list of tokens
lexer :: String -> IO [Token]
lexer file = do
  s <- readFile file
  -- comment deals with the comment and error checking
  return (comment (alexScanTokens s) 0)

--main :: IO ()
--main = do
--   args <- getArgs
--   -- Check if proper number of args were supplied
--   case (length args) of
--       1 -> do
--           ts <- lexer (head args)
--           -- | Check if there are any errors in the list of tokens
--           case (length (filter isError ts)) of
--               0 -> do
--                   -- Print the list of tokens as a space separated list of token names
--                   mapM_ putStr (map (\t -> (head $ words $ show t) ++ " ") ts)
--               _ -> printErrors (filter isError ts)
--       _ -> do
--           putStrLn "Usage: filename"

}
