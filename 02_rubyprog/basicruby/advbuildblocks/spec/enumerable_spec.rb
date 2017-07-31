require "enumerable"

describe Enumerable do

	describe "#my_each_with_index" do
		context "with an empty array" do
			it "does not produce output" do
				empty_array = []
				expect(empty_array.my_each_with_index).to eq("")
			end
		end
		context "with an array with two elements" do
			it "prints two elements from the array" do
				array = [13, 24]
				expect(array.my_each_with_index { |element| element }).to eq(1324)
			end
		end
		context "with an array with two elements" do
			it "prints two elements from the array with index" do
				array = [13, 24]
				expect(array.my_each_with_index { |x, idx| print "#{x},#{idx}," }).to eq("13,0,24,1")
			end
		end
	end
	describe "#my_all?" do
		context "returns true" do
			it "when all elements evaluate as true" do
				array = [3,2,12,6,7]
				expect(array.my_all? { |element| element > 0 }).to eq(true)
			end
		end
	end

end