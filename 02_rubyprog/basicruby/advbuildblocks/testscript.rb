require "./enumerable"

class My_methods
	include Enumerable
	attr_reader :array
	def initialize(array)
		@array=array
	end
end

a=My_methods.new([1,5,7,9,3,2,1])

a.array.my_each_with_index do |x,idx|
	print [idx,x]
end
