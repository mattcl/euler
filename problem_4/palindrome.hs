main = print $ maximum $ filter (\x -> let x' = show x in x' == reverse x') $ map product $ (sequence . replicate 2) [100..999]
