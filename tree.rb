require_relative "./node.rb"
require_relative "./merge_sort.rb"

class Tree
  attr_accessor :root, :sorted_arr

  def initialize(arr)
    @sorted_arr = merge_sort(arr)
    @root = build_tree(@sorted_arr)
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
  def inorder(node = @root, output = [], &block)
    return if node.nil?

    if block_given?
      inorder(node.left, &block)
      block.call(node)
      inorder(node.right, &block)
    else
      inorder(node.left, output)
      output.push(node.data)
      inorder(node.right, output)
    end

    output
  end

  # preorder: Root Left Right (roots first)
  def preorder(node = @root, output = [], &block)
    return if node.nil?

    if block_given?
      block.call(node)
      preorder(node.left, &block)
      preorder(node.right, &block)
    else
      output.push(node.data)
      preorder(node.left, output)
      preorder(node.right, output)
    end

    output
  end

  # postorder: Left Right Root (leaves first)
  def postorder(node = @root, output = [], &block)
    return if node.nil?

    if block_given?
      postorder(node.left, &block)
      postorder(node.right, &block)
      block.call(node)
    else
      postorder(node.left, output)
      postorder(node.right, output)
      output.push(node.data)
    end

    output
  end

  def height(node = @root, height = -1) # number of edges from a given node to deepest leaf node
    return height if node.nil?

    left_max_height = height(node.left, height + 1)
    right_max_height = height(node.right, height + 1)

    if left_max_height > right_max_height
      return left_max_height
    else
      return right_max_height
    end
  end

  def depth(node = @root, parent = @root, edges = 0) # number of edges from a given node to root node
    return edges if node == parent || parent.nil?

    if node.data < parent.data
      edges += 1
      depth(node, parent.left, edges)
    elsif node.data > parent.data
      edges += 1
      depth(node, parent.right, edges)
    else
      edges
    end
  end

  def balanced?(node = root)
    return true if node.nil?

    left_height = height(node.left)
    right_height = height(node.right)

    return true if (left_height - right_height).abs <= 1 && balanced?(node.left) && balanced?(node.right)

    false
  end

  def rebalance
    @sorted_arr = self.inorder
    @root = build_tree(@sorted_arr)
  end
end