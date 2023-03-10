## Summary

GHC 9.4.4 causes below error when compiling the code which depend on 
both `file-embed` and `proteaaudio` package on Windows, while GHC 8.10.7 does not.

~~~
<no location info>: error:
    addDLL: stdc++ or dependencies not loaded. (Win32 error 126)
~~~

Individually, these packages can be compiled and executed with no problem.
Especially, generated sample executable for `proteaaudio` runs fine.

However, when both `file-embed` and `proteaaudio` are added to build-depends field of .cabal file, below trivial code does not compile:

~~~
{-# LANGUAGE TemplateHaskell #-}
module Main where

import Data.FileEmbed
import Data.ByteString (ByteString)

main :: IO ()
main = putStrLn "Hello World!"

buffer :: ByteString -- not used
buffer = $(embedFile "data/mm2_1401.wav")
~~~

If you comment out `buffer` or 

## Steps to reproduce

~~~
% git clone https://github.com/wkoiking/proteaaudio-test.git
% cd proteaaudio-test
% stack build
~~~

When the code depends only on `proteaaudio`, the error does not occur.
Which can be checked by:

~~~
% git checkout 765abc2
% stack run
~~~

## Expected behavior

Compilation succeed without error.

## Environment

GHC version used: GHC 9.4.4

Optional:

Operating System: Windows 10 Home (10.0.19044 build 19044)
System Architecture: x86_64
