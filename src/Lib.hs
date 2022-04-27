{-# LANGUAGE ViewPatterns #-}

module Lib
  ( isValidCard
  ) where
import           Data.Function                  ( (&) )

-- isValidCard returns whether 
-- a credit card number is valid
isValidCard :: [Int] -> Bool
isValidCard (reverse -> (x:y)) = total `mod` 10 == 0
  where total = performCalculation x y
isValidCard []      = False
isValidCard (_ : _) = False

-- performCalculation runs the logic for calculating
-- a value according to business logic rules
performCalculation :: Int -> [Int] -> Int
performCalculation x y = multiplyInOddPositions y & subtract' & sum & (+ x)

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
