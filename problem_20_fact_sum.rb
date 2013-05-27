puts (1..100).inject { |p, n| p * n }.to_s.each_char.reduce(0) { |sum, ch| sum + ch.to_i }
