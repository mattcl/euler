import math

def is_palindrome(num):
    s = "%d" % (num)
    l = len(s)
    sub = s[:l/2][::-1]
    e = s[int(math.ceil(l/2.0)):]
    if sub == e:
        return True
    return False

largest = 0
for i in range(100, 1000):
    for k in range(100, 1000):
        v = i * k
        if is_palindrome(v) and v > largest:
            largest = v

print largest

