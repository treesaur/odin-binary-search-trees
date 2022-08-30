require_relative "./node.rb"
require_relative "./tree.rb"

test_arr = [1,2,3,4,5,6,7]
test = Tree.new(test_arr)
puts test.pretty_print
# p test.level_order
# p test.level_order { |v| puts "tested #{v}"}
# puts test.inorder
# puts test.inorder { |data| p data.data + 5 }
# puts test.preorder
# puts test.preorder { |v| p v.data + 1}
# puts test.postorder
# puts test.postorder { |v| p v.data + 1}

# test_arr_2 = [0,1,2,3,4,5,6,7,8,9,10]
# test_2 = Tree.new(test_arr_2)
# puts test_2.pretty_print
# puts test_2.preorder

