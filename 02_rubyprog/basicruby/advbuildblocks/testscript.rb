require "./enumerable"

class My_methods
	include Enumerable
	attr_reader :items
	def initialize(items)
		@items=items
	end
end

array1=[1,5,7,9,3,2,1]
hash1={'item1':'horse', 'item2':'giraffe', 'item3':'monkey'}
a=My_methods.new(array1)

c=a.items.none? do |x|
	x==2
end

print c

b=a.items.my_none? do |x|
	x==2
end
print b