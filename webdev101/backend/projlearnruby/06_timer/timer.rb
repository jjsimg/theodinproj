class Timer
  #write your code here
  attr_reader :seconds
  def initialize
  	@seconds=0
  end
  def time_string
  	@seconds
  end
end
@timer=Timer.new
# @timer.seconds=4
puts @timer.seconds