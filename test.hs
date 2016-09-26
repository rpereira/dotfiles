#!/usr/bin/env runhaskell

module Main where

import System.Environment
import System.IO
import System.Exit

main :: IO ()
main = do
    (fname:_) <- getArgs
    fdata <- readFile fname
    print (trailingPeriod (subject fdata))

subject :: FilePath -> String
subject input =
    head (lines input)

trailingPeriod :: String -> Bool
trailingPeriod subject =
    last (subject) == '.'
