sum = 0
x = 3
while x < 1000:
    if x % 5 is not 0:
        sum += x
    x += 3

x = 5
while x < 1000:
    sum += x
    x += 5

print sum
