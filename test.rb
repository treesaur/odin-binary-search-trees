require_relative "./node.rb"
require_relative "./tree.rb"

# test_arr = [1,2,3,4,5,6,7]
# test = Tree.new(test_arr)
# puts test.pretty_print
# p test.level_order
# p test.level_order { |v| puts "tested #{v}"}
# p test.inorder
# puts test.inorder { |data| p data.data + 5 }
# puts test.preorder
# puts test.preorder { |v| p v.data + 1}
# puts test.postorder
# puts test.postorder { |v| p v.data + 1}
# puts test.height(test.find(3))
# puts test.height
# puts test.height(test.find(6))
# puts test.depth
# puts test.depth(test.find(3))
# puts test.balanced?
# puts test.rebalance

#TOP Driver Script
random_arr = Array.new(15) {rand(1..100)}
test = Tree.new(random_arr)
test.pretty_print
puts test.balanced?
p test.inorder
p test.preorder
p test.postorder
test.insert(105)
test.insert(150)
test.insert(3000)
test.insert(5000)
test.insert(423)
test.pretty_print
p test.balanced?
test.rebalance
p test.balanced?
test.pretty_print
p test.level_order
p test.inorder
p test.preorder
p test.postorder
