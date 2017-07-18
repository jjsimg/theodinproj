class BinarySearchTree

  def initialize(root_value=nil)
    @root = Node.new(root_value) unless root_value.nil?
  end

  def build_tree(array)
    binary_tree = BinarySearchTree.new
    array.each { |element| binary_tree.add_node(element) }
    binary_tree
  end

  def add_node(value)
    if @root.nil?
      @root = Node.new(value)
    else
      add_to_binary_tree(Node.new(value), @root)
    end
  end

  def add_to_binary_tree(node, parent)
    return node if parent.nil?

    node.parent = parent
    if node.value < parent.value
      parent.child_left = add_to_binary_tree(node, parent.child_left)
    else
      parent.child_right = add_to_binary_tree(node, parent.child_right)
    end
    parent
  end

  def breadth_first_search
  end

  def depth_first_seach
  end

  def dfs_rec
  end

end

class Node
  attr_accessor :value, :child_left, :child_right, :parent

  def initialize(value, cl_node=nil, cr_node=nil, p_node=nil)
    @value = value
    @child_left = cl_node
    @child_right = cr_node
    @parent = p_node
  end

end

a = BinarySearchTree.new
print a.build_tree([1, 7, 4, 23, 8, 9, 5, 7, 9, 67, 6345, 324])