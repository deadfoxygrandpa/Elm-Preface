module Preface where

isEmpty : [a] -> Bool
isEmpty xs = case xs of
               []     -> True
               (_::_) -> False

repeat : a -> Int -> [a]
repeat x n = if | n <= 0    -> []
                | otherwise -> x::repeat x (n-1)

replicate : Int -> a -> [a]
replicate n x = repeat x n

isEven : Int -> Bool
isEven n = n `mod` 2 == 0

isOdd : Int -> Bool
isOdd = not . isEven

takeWhile : (a -> Bool) -> [a] -> [a]
takeWhile p xs = case xs of
                   []     -> []
                   (h::t) -> if | p h       -> h :: takeWhile p t
                                | otherwise -> []

dropWhile : (a -> Bool) -> [a] -> [a]
dropWhile p xs = case xs of
                   []     -> []
                   (h::t) -> if | p h       -> dropWhile p t
                                | otherwise -> xs

init : [a] -> [a]
init xs = case xs of
            []     -> []
            [x]    -> []
            (h::t) -> h :: init t

tail : [a] -> [a]
tail xs = case xs of
            []     -> []
            (h::t) -> t

index : [a] -> Int -> Maybe a
index xs n = case xs of
              []     -> Nothing
              (h::t) -> if | n <= 0    -> Nothing
                           | n == 1    -> Just h
                           | otherwise -> t `index` (n-1)
