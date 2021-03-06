module WorkshopOne.WarmUp where


factorial :: Word -> Word
factorial n
  | n < 2     = 1
  | otherwise = n * factorial (n - 1)

factorial' :: Word -> Word
factorial' 0 = 1
factorial' 1 = 1
factorial' n = n * factorial' (n - 1)

factorial'' :: Word -> Word
factorial'' n =
  case n of
    0 -> 1
    1 -> 1
    _ -> n * factorial'' (n - 1)

product' :: [Int] -> Int
product' (x:xs) = x * product' xs
product' [] = 1

product'' :: [Int] -> Int
product'' xs = go 1 xs
  where go acc [] = acc
        go acc (y:ys) = go (y * acc) ys

elem' :: Eq a => a -> [a] -> Bool
elem' n (x:xs) = n == x || elem' n xs
elem' _ [] = False

-- an isogram is a word without a repeating letter
isogram :: String -> Bool
isogram (c:cs) = not (elem' c cs) && isogram cs
isogram _ = True

words' :: String -> [String]
words' "" = []
words' s  =
  case takeSymbols (skipSpaces s) of
    ("", rest) -> words' rest
    (taken, rest) -> taken : words' rest

takeSymbols :: String -> (String, String)
takeSymbols s = go "" s
  where go acc (' ':cs) = (acc, ' ':cs)
        go acc (c:cs)   = go (acc ++ [c]) cs
        go acc ""       = (acc, "")

skipSpaces :: String -> String
skipSpaces (' ':cs) = skipSpaces cs
skipSpaces s = s
