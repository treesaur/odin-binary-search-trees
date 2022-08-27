require_relative "./node.rb"
require_relative "./tree.rb"

test_arr = []
30.times { test_arr << rand(1000) }
test = Tree.new(test_arr)
puts test.pretty_print