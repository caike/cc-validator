module Lib
  ( isValidCard
   ,isValidCardStr
  ) where

import Data.Char

-- isValidCardStr is used by the HTTP endpoint.
-- It expects a card number as a string and returns
-- whether it is a valid or not
isValidCardStr :: [Char] -> Bool
isValidCardStr = isValidCard . convertToListOfNumbers

-- isValidCard returns whether 
-- a credit card number is valid
isValidCard :: [Int] -> Bool
isValidCard xs = total `mod` 10 == 0
 where
  (x : y) = reverse xs
  total   = performCalculation x y

-- performCalculation runs the logic for calculating
-- a value according to business logic rules
performCalculation :: Int -> [Int] -> Int
performCalculation x y =
  let multResult = multiplyInOddPositions y
      subResult  = subtract' multResult
      sumResult  = sum subResult
  in sumResult + x

-- multiplyInOddPositions multiplies every other
-- element by 2, starting with the first
multiplyInOddPositions :: [Int] -> [Int]
multiplyInOddPositions (x : y : rest) =
  [x * 2, y] ++ multiplyInOddPositions rest
multiplyInOddPositions [x] = [x * 2]
multiplyInOddPositions []  = []

-- subtract' subtracts 9 from every
-- element higher than 9
subtract' :: [Int] -> [Int]
subtract' n = [ if x > 9 then x - 9 else x | x <- n ]

convertToListOfNumbers :: [Char] -> [Int]
convertToListOfNumbers xs =
  map (\x -> read [x]::Int) (filter isDigit xs)