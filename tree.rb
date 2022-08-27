require_relative "./node.rb"
require_relative "./merge_sort.rb"

class Tree
  attr_accessor :root

  def initialize(arr)
    sorted_arr = merge_sort(arr)
    @root = build_tree(sorted_arr)
  end

  def build_tree(arr, start = 0, finish = arr.length - 1)
    return nil if start > finish

    middle_idx = (start + finish)/2
    root_node = Node.new(arr[middle_idx])

    root_node.left = build_tree(arr, start, middle_idx - 1)
    root_node.right = build_tree(arr, middle_idx + 1, finish)
    root_node
  end

  # Method to visualize tree:
  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end

  def insert(value)

  end

  def delete(value)

  end

  def find(value)

  end

  def level_order
    yield
  end

  def inorder
    yield
  end

  def preorder
    yield
  end

  def postorder
    yield
  end

  def height(node)

  end

  def depth(node)

  end

  def balanced?

  end

  def rebalance

  end
end