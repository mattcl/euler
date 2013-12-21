def primes():
    yield 2
    D = {}
    q = 3
    while True:
        p = D.pop(q, 0)
        if p:
            x = p + q
            while x in D: x += p
            D[x] = p
        else:
            yield q
            D[q*q] = 2*q
        q += 2

sum = 0
for p in primes():
    if p > 2000000:
        break
    sum += p

print sum
