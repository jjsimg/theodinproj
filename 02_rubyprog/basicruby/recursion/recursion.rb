def merge_sort(array)
	# while sorted_array != array.sort
	sorted_array = Array.new
		array.each_with_index do |x, idx|
			if idx%2==0
				sorted_array.push(array.select { array[idx] < array[idx+1] })
			end
		end
		print sorted_array
	# end
end

merge_sort([4,3,2,8,13,2,9,7])