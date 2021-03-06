module Enumerable
  def my_each
      for i in 0...self.length
        yield(self[i])
      end
  end

  def my_each_with_index
    if self.length < 1
      return ""
    end
    for i in 0...self.length
      yield(self[i],i)
    end
    self
  end

  def my_select
    result=[]
    for i in 0...self.length
      if yield(self[i])
        result.push(self[i])
      end
    end
    result
  end

  def my_all?
    for i in 0...self.length
      if yield(self[i])==false
        return false
      end
    end
    true
  end

  def my_any?
    for i in 0...self.length
      if yield(self[i])
        return true
      end
    end
    false
  end

  def my_none?
    for i in 0...self.length
      if yield(self[i])
        return false
      end
    end
    true
  end

  def my_count(input=nil)
    if block_given?
      count=0
      for i in 0...self.length
        if yield(self[i])
          count+=1
        end
      end
      count
    elsif input.is_a? Integer
      count=0
      for i in 0...self.length
        if self[i]==input
          count+=1
        end
      end
      count
    elsif input==nil
      self.length
    end
  end

  def my_inject(input=nil)
    if input==nil
      accum=yield(self[0],self[1])
    else
      accum=yield(input,yield(self[0],self[1]))
    end
    for i in 1...self.length-1
      accum=yield(accum,self[i+1]) 
    end
    accum
  end

  def multiply_els
    # must use #my_inject method
    self.my_inject do |product,x|
      product*x
    end
  end

  def my_map
    # must take block and proc
    result=[]
    for i in 0...self.length
      result.push(yield(self[i]))
    end
    result
  end
end
