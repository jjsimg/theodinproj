class LinkedList

  def initialize(value)
    @head = Node.new(value) unless value==nil
  end

  def append(value)
    current = traverse
    current.next = Node.new(value)
  end

  def my_prepend(value)
    new_node = @head
    new_node.value = value
    new_node.next = @head.next
  end

  def size
    current = @head
    count = 0 if current.value == nil
    count = 1 if current.value != nil
    while current.next != nil
      current = current.next
      count += 1
    end
    count
  end

  def head
    @head.value
  end

  def tail
    current = traverse
    current.value
  end

  def at(index)

  end

  def pop
  end

  def contains?
  end

  def find(data)
  end

  def to_s
  end

  def traverse
    current = @head
    while current.next != nil
      current = current.next
    end
    current
  end
end

class Node
  attr_accessor :value, :next

  def initialize(value, next_node=nil)
    @value = value
    @next = next_node
  end
end

a=LinkedList.new(4)
a.append(3)
a.my_prepend(2)
# a.append(8)
puts a.size