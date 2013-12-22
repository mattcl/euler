main = print $ until (\x -> 0 == sum (map (mod x) [1..20])) (+inc) inc
  where inc = product [3,5,7,11,13,17,19]
