{-# LANGUAGE TemplateHaskell #-}
module Main where

-- base
import Control.Concurrent (threadDelay)
-- file-embed
import Data.FileEmbed
-- bytestring
import Data.ByteString (ByteString)
import qualified Data.ByteString as B
-- proteaaudio
import Sound.ProteaAudio

main :: IO ()
main = putStrLn "Hello World!"
-- main = playAudio

buffer :: ByteString -- not used
buffer = $(embedFile "data/mm2_1401.wav")

-- playAudio :: IO ()
-- playAudio = do
--     _ <- initAudio 64 44100 1024 -- max channels, mixing frequency, mixing buffer size
--     
--     -- load from memory buffer
--     buf <- B.readFile "data/mm2_1401.wav"
--     
--     sample <- sampleFromMemoryWav buf 1
--     soundPlay sample 1 1 0 1 -- left volume, right volume, time difference between left and right, pitch factor for playback
--     threadDelay $ 2 * 1000000
--     
--     finishAudio
