class Knight

  def initialize
    @root = Node.new(nil)
  end

  def knight_moves(start_pos, end_pos)
    return if start_pos == end_pos

    positions = get_positions(start_pos)
    iterate_through_moves(positions)
    # knight_moves(new_pos, end_pos)

    

    # print get_positions(start_pos)
  end

  def get_positions(init_pos)
    queue = []

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
      pos_t = init_pos
      r = [pos_t, arr[i]].transpose.map { |x| x.reduce(:+) }
      if r[0] >= x_lower_bound and r[0] <= x_upper_bound and 
         r[1] >= y_lower_bound and r[1] <= y_upper_bound
        queue.push(r)
      end
      # print "[#{r[0]}, #{r[1]}]\n"
    end
    queue #returns all of the possible positions that the knight can travel on chess board as an array
  end

  def iterate_through_moves(array)
    array.each { |xy_pos| make_list(xy_pos, @root) }

  end

  def make_list(current_pos, node)
    current_node = Node.new(current_pos)
    if @root.next_node.nil?
      @root.next_node = current_node
    end
    current_node.prev_node = node
    current_node.next_node = node
  end


end

class Node
  attr_accessor :current_loc, :next_node, :prev_node

  def initialize(position, next_node = nil, prev_node = nil)
    @current_loc = position
    @next_node = next_node
    @prev_node = prev_node
  end
end

k = Knight.new

k.knight_moves([3,3],[4,3])