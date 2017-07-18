class BinarySearchTree
  def initialize(root_value)
    @root = Node.new(root_value)
  end

  def build_tree(array)
    current = @root

    array.each do |num|
      current.parent = current
      if current.child_left == nil
        current.child_left = Node.new(num)
        next
      end
      if current.child_right == nil
        current.child_right = Node.new(num)
        next
      end
      current = current.child_left
    end

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

a = BinarySearchTree.new(2)
a.build_tree([1, 7, 4, 23, 8, 9, 5, 7, 9, 67, 6345, 324])