class Book
# write your code here
	attr_reader :title #this allows the instance variable to access title variable
	@@noncaps=%w(a an and in of the) #syntax for creating an array with string elements

	def title=(booktitle)
		@title=""
		booktitle.split.each_with_index do |word,index|
			if not @@noncaps.include? word or index==0
				@title << word.capitalize+" "
			else
				@title << word+" "
			end
		end
		@title=@title.chomp(" ")
	end
end
