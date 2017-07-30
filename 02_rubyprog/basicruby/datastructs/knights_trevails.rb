class Knight

  def initialize
    @root = Node.new(nil)
  end

  def knight_moves(start, target)
    start_pos = Node.new(start)
    end_pos = traverse(start_pos, target)
    route = find_route(end_pos)
    print_route(route)
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
    # print queue
    queue #returns all of the possible positions that the knight can travel on chess board as an array
  end

  def traverse(start_pos, target)
    current_pos = start_pos
    queue = []

    loop do
      coordinates_to_check = get_positions(current_pos.current_loc)
      coordinates_to_check.each do |coordinates|
        move = Node.new(coordinates)
        move.prev = current_pos
        return move if move.current_loc == target
        queue << move
      end
      current_pos = queue.shift
    end
  end

  def find_route(end_pos)
    current_pos = end_pos
    route = []
    until current_pos.nil?
      route << current_pos.current_loc
      current_pos = current_pos.prev
    end
    route
  end

  def print_route(route)
    number_of_moves = route.size - 1
    print "You made it in #{number_of_moves} steps! Here's your path:\n"
    route.reverse.each { |step| print "#{step}\n" }
  end

end

class Node
  attr_accessor :current_loc, :prev

  def initialize(position, prev_node = nil)
    @current_loc = position
    @prev = prev_node
  end
end

k = Knight.new

k.knight_moves([1,1],[5,7])