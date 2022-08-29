require_relative "./node.rb"
require_relative "./tree.rb"

test_arr = [1,2,3,4,5,6,7]
test = Tree.new(test_arr)
puts test.pretty_print
test.delete(6)
puts test.pretty_print