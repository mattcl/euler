list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9].permutation(10).to_a.collect(&:join).sort
puts list[1000000 - 1]
