class Knight

  def initialize
    @root = nil
  end

  def knight_moves(start_pos, end_pos)
    return if start_pos == end_pos

    new_pos = traverse(start_pos, node)
    return if new_pos == end_pos
    knight_moves(new_pos, end_pos)

    

    # print traverse(start_pos)
  end

  def traverse(pos, node)
    x_upper_bound = 8
    x_lower_bound = 1
    y_upper_bound = 8
    y_lower_bound = 1

    tl1 = [-1, 2]
    tr1 = [1, 2]
    ml1 = [-2, 1]
    mr1 = [2, 1]
    ml2 = [-2, -1]
    mr2 = [2, -1]
    bl1 = [-1, -2]
    br1 = [1, -2]
    arr = [tl1, tr1, ml1, mr1, ml2, mr2, bl1, br1]



    8.times do |i|
      pos_t = pos
      r = [pos_t, arr[i]].transpose.map { |x| x.reduce(:+) }
      if r[0] >= x_lower_bound and r[0] <= x_upper_bound and 
         r[1] >= y_lower_bound and r[1] <= y_upper_bound
        # print "[#{r[0]}, #{r[1]}]\n" 
        return node.child = Node.new(pos_t)
      end
      # print "[#{r[0]}, #{r[1]}]\n"
    end

  end

end

class Node
  attr_accessor :position, :child, :parent

  def initialize(position, next_node = nil, prev_node = nil)
    @position = position
    @next_node = next_node
    @prev_node = prev_node
  end
end

k = Knight.new

k.knight_moves([3,3],[4,3])