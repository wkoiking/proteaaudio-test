{-# LANGUAGE TemplateHaskell #-}
module Main where

import Data.FileEmbed
import Data.ByteString (ByteString)

main :: IO ()
main = putStrLn "Hello World!"

buffer :: ByteString -- not used
buffer = $(embedFile "data/mm2_1401.wav")
