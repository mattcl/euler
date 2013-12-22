main = print $ (sum xs)^2 - sum (map (^2) xs) where xs = [1..100]
