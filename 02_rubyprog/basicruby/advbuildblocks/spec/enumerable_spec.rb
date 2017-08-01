require "enumerable"

describe Enumerable do

	describe "#my_each_with_index" do
		context "with an empty array" do
			it "does not produce output" do
				empty_array = []
				expect(empty_array.my_each_with_index).to eq("")
			end
		end
		context "with an array with 3 elements" do
			array = [3, 11, 9]

			it "adds all three elements" do
				addition = 0
				array.my_each_with_index { |element| addition += element }
				expect(addition).to eq(23)
			end
			it "also tracks the indexes" do
				idx_array = []
				array.my_each_with_index { |x, idx| idx_array << idx }
				expect(idx_array).to eq([0, 1, 2])
			end
		end
	end

	describe "#my_all?" do
		context "returns true" do
			array = [3,2,12,6,7]

			it "when all elements evaluate as true" do
				expect(array.my_all? { |element| element > 0 }).to eq(true)
			end
			it "when 2 elements are true" do
				expect(array.my_all? { |element| element % 2 != 0 }).to eq(false)
			end
		end
	end

	describe "#my_select" do
		context "returns elements in array" do
			array = [2,4,6,5]

			it "when elements are even valued" do
				expect(array.my_select{ |element| element % 2 == 0 }).to eq([2, 4, 6])
			end
			it "when elements are less than 5" do
				expect(array.my_select{ |element| element < 5}).to eq([2,4])
			end
		end
	end

	describe "#My_inject" do
		context "accumulates numerical operations throughout array" do
			array = [2,4,6,5]

			it "calculates the sum" do
				sum = array.my_inject{ |sum, x| sum + x }
				expect(sum).to eq(17)
			end
			it "calculates the product" do
				product = array.my_inject{ |product, x| product * x }
				expect(product).to eq(240)
			end
			it "takes an input and includes it in calculation" do
				sum = array.my_inject(3) { |sum, x| sum + x }
				expect(sum).to eq(20)
			end
		end
	end

	describe "#my_count" do
		array = [3,2,2,1]
		context "counts elements in array if no input or block given" do
			it "returns 4" do
				expect(array.my_count).to eq(4)
			end
		end
		context "counts elements in array given input as integer" do
			it "returns 2" do
				expect(array.my_count(2)).to eq(2)
			end
		end
		context "counts elements that evaluate as true in block" do
			it "returns 1" do
				expect(array.my_count { |element| element == 1 }).to eq(1)
			end
		end
	end

	describe "#my_map" do
		array = [1,2,3,4]
		context "take a block" do
			it "and evaluates the block" do
				new_array = array.my_map { |element| element**2 }
				expect(new_array).to eq([1,4,9,16])
			end
			it "and evaluates a proc" do
				test_proc = Proc.new { |x| x**2 }
				new_array = array.my_map(&test_proc)
				expect(new_array).to eq([1,4,9,16])
			end
		end
	end

end