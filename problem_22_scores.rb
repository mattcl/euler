# i was feeling like doing this in one line for some reason
puts File.read('names.txt').gsub(/"/, '').split(',').map(&:strip).sort.each_with_index.to_a.collect { |o| (o[1] + 1) * o[0].bytes.to_a.collect { |b| b - 64 }.reduce(:+) }.reduce(:+)
