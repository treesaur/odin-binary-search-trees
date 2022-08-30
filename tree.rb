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

  def insert(value, node = @root)
    return node = Node.new(value) if node.nil?

    if value < node.data
      node.left = insert(value, node.left)
    elsif value > node.data
      node.right = insert(value, node.right)
    end

    node
  end

  def delete(value, node = @root)
    return node if node.nil?

    if value < node.data
      node.left = delete(value, node.left)
    elsif value > node.data
      node.right = delete(value, node.right)
    else
      # if node has one or no child
      return node.right if node.left.nil?
      return node.left if node.right.nil?

      # if node has two children
      leftmost_node = leftmost_leaf(node.right)
      node.data = leftmost_node.data
      node.right = delete(leftmost_node.data, node.right)
    end

    node
  end

  def leftmost_leaf(node)
    node = node.left until node.left.nil?

    node
  end

  def find(value, node = @root)
    return node if node.nil? || node.data == value

    if value < node.data
      find(value, node.left)
    elsif value > node.data
      find(value, node.right)
    end
  end

  def level_order
      queue = [@root]
      result = []
      until queue.empty?
        node = queue.shift
        block_given? ? yield(node) : result << node.data
        queue << node.left unless node.left.nil?
        queue << node.right unless node.right.nil?
      end

      result unless block_given?
  end

  # inorder: Left Root Right
  def inorder(node = @root, &block)
    return if node.nil?

    if block_given?
      inorder(node.left, &block)
      block.call(node)
      inorder(node.right, &block)
    else
      inorder(node.left)
      print "#{node.data} "
      inorder(node.right)
    end
  end

  # preorder: Root Left Right (roots first)
  def preorder(node = @root, &block)
    return if node.nil?

    if block_given?
      block.call(node)
      preorder(node.left, &block)
      preorder(node.right, &block)
    else
      print "#{node.data} "
      preorder(node.left)
      preorder(node.right)
    end
  end

  # postorder: Left Right Root (leaves first)
  def postorder(node = @root, &block)
    return if node.nil?

    if block_given?
      postorder(node.left, &block)
      postorder(node.right, &block)
      block.call(node)
    else
      postorder(node.left, &block)
      postorder(node.right, &block)
      print "#{node.data} "
    end
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