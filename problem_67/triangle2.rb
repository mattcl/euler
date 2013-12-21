# helper class for storing nodes, printing tree for debugging
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
numbers = File.open('triangle.txt').lines.collect { |line| line.strip.split(' ').collect { |num| num.to_i } }

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

# work problem

layers = layers.reverse
layers.shift

layers.each do |layer|
  layer.each do |node|
    node.value = node.value + [node.left.value, node.right.value].max
  end
end

puts layers.last.first.value
