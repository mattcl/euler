
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

stop = 600851475143
for p in primes():
    if stop % p is 0:
        print p
    if stop < p:
        break
