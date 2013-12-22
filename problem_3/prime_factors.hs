primes = 2 : primes'
  where
    primes' = sieve [3,5..] 9 primes'
    sieve (x:xs) q ps@ ~(p:t)
      | x < q = x : sieve xs q ps
      | True  = sieve [x | x <- xs, rem x p /= 0] (head t^2) t

main = print $ last $ [x | x <- takeWhile (< 10000) primes, 600851475143 `mod` x == 0]
