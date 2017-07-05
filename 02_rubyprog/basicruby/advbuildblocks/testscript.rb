require "./enumerable"

class My_methods
	include Enumerable
	attr_reader :items
	def initialize(items)
		@items=items
	end
end

array1=[-2,5,7,9,3,6,1]
hash1={'item1':'horse', 'item2':'giraffe', 'item3':'monkey'}
a=My_methods.new(array1)

# d=Proc.new do |x|
# 	x+2
# end

# f=lambda do |x|
# 	x+3
# end

# c=a.items.inject

# print c

c=a.items.inject do |product,n| 
	product*n
end
print c

b=a.items.my_inject do |product,n| 
	product*n
end
print b

d=a.items.multiply_els
print d