# setup
raw = <<EOL
75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
EOL

class Node
  attr_accessor :value, :left, :right
  def initialize(value)
    @value = value
  end

  def str_value
    leader = value < 10 ? '0' : ''
    leader + value.to_s
  end

  def self.pretty_print(root)
    height = 2
    cur = root.left
    while cur = cur.left
      height += 1
    end

    self.pretty_print_layer([root], height / 2 + 1)
  end

  def self.pretty_print_layer(layer, offset)
    values = layer.collect do |node|
      if node.nil?
        '  '
      else
        node.str_value
      end
    end
    puts '  ' * offset + values.join('  ')
    if offset > 0
      first = layer.shift
      next_layer = [first.left, first.right]
      next_layer += layer.collect { |node| node.right }
      self.pretty_print_layer(next_layer, offset - 1)
    end
  end
end

# build tree
numbers = raw.lines.collect { |line| line.strip.split(' ').collect { |num| num.to_i } }

root = Node.new(numbers.shift.first)
layers = [[root]]
previous_nodes = [root]
numbers.each do |line|
  nodes = line.collect { |num| Node.new(num) }
  layers << nodes
  nodes.each_with_index do |node, index|
    previous = index - 1
    previous_nodes[index].left = node if index < previous_nodes.length
    previous_nodes[previous].right = node if previous >= 0
  end
  previous_nodes = nodes
end

Node.pretty_print(root)

# work problem

layers = layers.reverse
layers.shift

layers.each do |layer|
  layer.each do |node|
    node.value = node.value + [node.left.value, node.right.value].max
  end
end

puts layers.last.first.value
