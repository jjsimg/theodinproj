class LinkedList

  def initialize(value)
    @head = Node.new(value) unless value==nil
  end

  def append(value)
    current = traverse_to_end
    current.next = Node.new(value)
  end

  def my_prepend(value)
    @head = Node.new(value, @head)
  end

  def size
    count = 0 if @head.value == nil
    count = 1 if @head.value != nil
    while @head.next != nil
      @head = @head.next
      count += 1
    end
    count
  end

  def head
    @head.value
  end

  def tail
    current = traverse_to_end
    current.value
  end

  def at(idx)
    current = @head
    idx.times { current = current.next }
    current.value
  end

  def pop
    current = @head
    prev = nil
    while current.next != nil
      prev = current
      current = current.next
    end
    prev.next = nil
  end

  def contains?(value)
    current = @head
    return true if value == current.value
    while current.next != nil
      current = current.next
      return true if value == current.value
    end
    false
  end

  def find(data)
    current = @head
    idx = 0
    return idx if current.value == data
    while current.next != nil
      idx += 1
      current = current.next
      return idx if current.value == data
    end
  end

  def to_s
    current = @head
    str = "( #{current} ) -> "
    while current.next != nil
      current = current.next
      str << "( #{current} ) -> "
    end
    str << "nil"
    str
  end

  def insert_at(idx, value)
    current = @head
    prev = current
    current.next = Node.new(value)
  end

  def remove_at(idx)
  end

  def traverse_to_end
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
a.append(8)
# 2438
# a.pop
puts a.to_s