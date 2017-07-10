class Test

	def method1
		@var1=5
		@board=method3
	end

	def method2
		var3=4
		if var3!=5
			puts "these are not equal"
		end
	end

	def method3
		var2=6
		if var2<=@var1
			puts "This also worked"
		else
			puts "var 2 is not less than our instance variable"
		end
		var2=method2
	end

end
Test.new.method1

class Test2 < Test
	def method4
		@vart2=5
		if @var1==@vart2
			puts "the instance variable from super class pass through!"
		else
			puts 'fail'
		end
	end
	def method5
	end
	def method6
	end
end
Test2.new.method4