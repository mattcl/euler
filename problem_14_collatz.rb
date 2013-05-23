# n -> n/2 if n is even
# n -> 3*n + 1 if n is odd

require 'pp'

@hist = Hash.new

def collatz(n)
  return 1 if n <= 1
  return @hist[n] if @hist.key?(n)
  return 1 + collatz(n / 2) if n.even?
  1 + collatz(3 * n + 1)
end

pp Hash[(1..1000000).collect { |n| [n, @hist[n] = collatz(n)] }].max_by { |k, v| v }
