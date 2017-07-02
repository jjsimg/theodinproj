def bubble_sort(num_array)
	is_sorted=false
	len=num_array.length-1
	until is_sorted
		for i in 0...len
			if num_array[i]<=num_array[i+1]
				next
			elsif num_array[i]>num_array[i+1]
				tmp=num_array[i]
				num_array[i]=num_array[i+1]
				num_array[i+1]=tmp
			end
		end
		if num_array==num_array.sort
			is_sorted=true
		end
	end
	num_array
end

# print bubble_sort([1,3,2,1,4,3,7,8,7])

def bubble_sort_by(num_array)
	len=num_array.length-1
	counter=0
	until counter==len
		for i in 0...len
			checklength = yield(num_array[i],num_array[i+1])
			if checklength<=0
				counter+=1
				next
			elsif checklength>0
				tmp=num_array[i]
				num_array[i]=num_array[i+1]
				num_array[i+1]=tmp
			end
		end
	end
	num_array
end

a=bubble_sort_by(['hi','hello','hey','however','hen','hose']) do |left,right|
	left.length-right.length
end
print a