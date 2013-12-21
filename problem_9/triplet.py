for a in range(1, 1001):
    for b in range(1, 1001 - a):
        c = 1000 - a - b
        if a * a + b * b == c * c:
            print "%d, %d, %d => %d" % (a, b, c, a * b * c)
