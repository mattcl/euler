
def check_div(num):
    print "checking: %d" % (num)
    for i in range (20,10,-1):
        if num % i is not 0:
            return False
    return True

inc = 3 * 5 * 7 * 11 * 13 * 17 * 19
x = inc
while True:
    if check_div(x):
        print "found! %d" % (x)
        break
    x += inc

