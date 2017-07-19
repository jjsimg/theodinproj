class BinarySearchTree
  attr_reader :root

  def initialize(root_value=nil)
    @root = Node.new(root_value) unless root_value.nil?
  end

  def build_tree(array)
    array.each { |element| add_node(element) }
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

  def breadth_first_search(target)
    queue = [@root]

    while not queue.empty?
      node = queue.shift
      return node if target == node.value

      if node.child_left != nil
        queue.push(node.child_left) 
      end
      if node.child_right != nil
        queue.push(node.child_right)
      end
    end
    nil # return nil if target doesn't find a match
  end

  def depth_first_seach(target)
    stack = [@root]

    while not stack.empty?
      node = stack.pop
      return node if target == node.value

      if node.child_left != nil
        stack.push(node.child_left)
      end

      if node.child_right != nil
        stack.push(node.child_right)
      end
    end
    nil
  end

  def dfs_rec(value, current_node = @root)
    return if current_node.nil?

    node = dfs_rec(value, current_node.child_left)
    return current_node if current_node.value == value
    return node unless node.nil?
    node = dfs_rec(value, current_node.child_right)
    node
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
a.build_tree([1, 7, 4, 23, 8, 9, 5, 7, 9, 67, 6345, 324])
print a.dfs_rec(324)