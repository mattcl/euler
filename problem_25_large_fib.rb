
previous = 1
cur = 1
term = 2

while "#{cur}".length < 1000
  tmp = cur
  cur += previous
  previous = tmp
  term += 1
end

puts term
