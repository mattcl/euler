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

count = 0
for p in primes():
    count += 1
    if count == 10001:
        print p
        break

