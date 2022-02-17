{-# LANGUAGE ViewPatterns #-}

module Lib
  ( isValidCard
  , multiplyInOddPositions
  , subtract'
  , someFunc
  ) where

isValidCard :: [Int] -> Bool
isValidCard (reverse -> (x:y)) = total `mod` 10 == 0
  where total = sum (subtract' (multiplyInOddPositions y)) + x
isValidCard (_ : _) = False
isValidCard []      = False

multiplyInOddPositions :: [Int] -> [Int]
multiplyInOddPositions (x : y : rest) =
  [x * 2, y] ++ multiplyInOddPositions rest
multiplyInOddPositions [x] = [x * 2]
multiplyInOddPositions []  = []

subtract' :: [Int] -> [Int]
subtract' n = [ if x > 9 then x - 9 else x | x <- n ]

someFunc :: IO ()
someFunc = putStrLn "this is a test"
