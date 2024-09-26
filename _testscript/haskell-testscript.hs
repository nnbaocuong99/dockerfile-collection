-- Test.hs

module Test where

import Test.HUnit

-- Function to test
add :: Int -> Int -> Int
add a b = a + b

-- Test cases
testAdd :: Test
testAdd = TestList [
    "test1" ~: "1 + 1 = 2" ~: 2 ~=? add 1 1,
    "test2" ~: "-1 + 1 = 0" ~: 0 ~=? add (-1) 1,
    "test3" ~: "0 + 0 = 0" ~: 0 ~=? add 0 0
    ]

-- Run tests
main :: IO Counts
main = runTestTT testAdd

-- Run tests using: runhaskell Test.hs
