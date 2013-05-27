word_map = {
  1 => 'one',
  2 => 'two',
  3 => 'three',
  4 => 'four',
  5 => 'five',
  6 => 'six',
  7 => 'seven',
  8 => 'eight',
  9 => 'nine',
  10 => 'ten',
  11 => 'eleven',
  12 => 'twelve',
  13 => 'thirteen',
  14 => 'fourteen',
  15 => 'fifteen',
  16 => 'sixteen',
  17 => 'seventeen',
  18 => 'eighteen',
  19 => 'nineteen',
  20 => 'twenty',
  30 => 'thirty',
  40 => 'forty',
  50 => 'fifty',
  60 => 'sixty',
  70 => 'seventy',
  80 => 'eighty',
  90 => 'ninety'
}

# brute force
total = (1..1000).reduce(0) do |sum, num|
  current = 0
  mod = num % 100

  if num >= 100 and num < 1000
    current += word_map[(num / 100).floor].length
    current += "hundred".length
    if mod != 0
      current += "and".length
    end
  elsif num == 1000
    current += "onethousand".length
  end

  if word_map.key?(mod)
    current += word_map[mod].length
  elsif mod != 0
    single = mod % 10
    base = mod - single
    current += word_map[base].length + word_map[single].length
  end
  sum + current
end

puts total

# reasoning

# from 1 to 100, "one" appears 10 times: 1, 21, 31, 41, 51, 61, 71, 81, 91, 100
# from 101 to 200, "one" appears 99 + 9 times
# from 201 to 300, "one" 9 times: 201, 221, 231, 241, 251, 261, 271, 281, 291
# from 901 to 1000, "one" 10 times
# total number of "one": 9 * 10 + 2 + 99

# from 1 to 100, "two" appears 9 times: 2, 22, 32, 42, 52, 52, 72, 82, 92
# from 101 to 200, "two" appears 10 times: 102, 122, 132, 142, 152, 152, 172, 182, 192, 200
# from 201 to 300, "two" appears 99 + 9 times
# from 301 to 400, "two" appears 9 times

# each numbmer from "two" to "nine" appears 9 * 10 + 100 times -> 190 times
# "one" appears 191 times, because of 1000
# total number of characters from this is:
total = (1..9).reduce(0) { |sum, num| sum + word_map[num].length * 190 } + word_map[1].length

# twenty, thirty, etc. appear 100 times each
total += (2..9).reduce(0) { |sum, num| sum + word_map[num * 10].length * 100 }

# each of the "teens," 10 included, appears 10 times
total += (10..19).reduce(0) { |sum, num| sum + word_map[num].length * 10 }

# "hundred" appears 900 times
total += 'hundred'.length * 900

# "and" appears 891 times
total += 'and'.length * 891

# "thousand" appears once
total += 'thousand'.length

puts total

