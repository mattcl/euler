
sum = 0
cur = 1
cur_prev = 0
while cur < 4000000:
    print cur
    if cur % 2 is 0:
        sum += cur
    tmp = cur
    cur = cur + cur_prev
    cur_prev = tmp

print sum
