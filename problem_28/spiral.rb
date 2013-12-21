# 43 44 45 46 47 48 49
# 42 21 22 23 24 25 26
# 41 20  7  8  9 10 27
# 40 19  6  1  2 11 28
# 39 18  5  4  3 12 29
# 38 17 16 15 14 13 30
# 37 36 35 34 33 32 31

# starting with 1 at the "core", each layer's diagonals are separated by 2 * layer

final = 1001 * 1001
previous = 1
sep = 2
diagonals = [previous]
count = 0
while previous < final
  cur = previous + sep
  diagonals << cur
  previous = cur
  count += 1
  sep += 2 if count % 4 == 0
end

puts diagonals.reduce(:+)
