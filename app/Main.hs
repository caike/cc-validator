{-# LANGUAGE OverloadedStrings #-}
module Main where

import Lib (isValidCardStr)

import qualified Data.Text.Lazy as T
import Web.Scotty

main :: IO ()
main = scotty 3000 $
  get "/" $ do
    number <- T.unpack <$> param "number" `rescue` (\_ -> return "")
    let message = validate number
    html message

validate :: String -> T.Text
validate "" = "Invalid"
validate number =
    let isValid = if isValidCardStr number then "Valid" else "Invalid"
        in T.pack isValid