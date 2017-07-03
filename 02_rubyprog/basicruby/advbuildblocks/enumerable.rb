module Enumerable
	def my_each
	    for i in 0...self.length
	    	yield(self[i])
	    end
	end

	def my_each_with_index
		for i in 0...self.length
			yield(self[i],i)
		end
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
			if yield(self[i])==true
				return true
			end
		end
		false
	end

	def my_none?
	end

	def my_count
	end

	def my_map
	end

	def my_inject
	end

	def multiply_els
		# must use #my_inject method
	end

	def my_map_proc
	end

	def my_map_proc_block
	end
end
