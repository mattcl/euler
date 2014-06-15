triangle = scanl (+) 1 [2..]

main = print $ triangle !! (until check (+1) 100000)
  where check = \x -> let num = triangle !! x in 500 <= length (filter (== 0) [1 | a <- [1..num], num `mod` a == 0])
