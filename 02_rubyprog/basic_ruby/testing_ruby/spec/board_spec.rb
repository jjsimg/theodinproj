require "board"




describe Board do

	let(:test_board) { Board.new }



	describe "#apply_choice" do
		context "places the correct symbol in the array" do
			before do
				@t_board = Board.new
			end
			it "and should be an 'X' if it is player 2's turn" do
				example_choice = 0
				example_symbol = "X"
				expect(@t_board.apply_choice(example_choice, example_symbol)).to eq("X")
			end
			it "will place an 'X' two times consecutively in a row" do
				example_choice1 = 1
				example_choice2 = 2
				example_symbol = "X"
				x = test_board.apply_choice(example_choice1, example_symbol)
				y = test_board.apply_choice(example_choice2, example_symbol)
				expect(x).to eq("X")
			end
		end
	end

	describe "#draw_board" do
		it "draws the board" do
			line = ["_","_","_","_","_","_","_"]
			board_array = [
						    line, line, line,
						    line, line, line
						  ]
			allow(test_board).to receive(:print).and_return("")
			expect(test_board.draw_board).to eq(board_array)
		end
	end

	describe "#check_horizontal" do
		context "will return true" do
			it "when 4 in a row horizontally" do
				example_choice1 = 0
				example_choice2 = 2
				# example_choice3 = 3
				# example_choice4 = 4
				example_symbol = "X"
				test_board.apply_choice(example_choice1, example_symbol)
				test_board.apply_choice(example_choice2, example_symbol)
				# test_board.apply_choice(example_choice3, example_symbol)
				# test_board.apply_choice(example_choice4, example_symbol)

				expect(test_board.check_horizontal(example_symbol)).to be true
			end
		end
		context "will return false" do
			it "when not 4 in a row horizontally" do
				test_symbol = "O"
				expect(test_board.check_horizontal(test_symbol)).to be false
			end
		end
	end

	describe "#check_vertical" do
		context "will return false" do
			it "when not 4 in a row vertically" do
				test_symbol = "X"
				test_choice = 3
				expect(test_board.check_vertical(test_symbol, test_choice)).to be false
			end
		end
	end

	describe "#check_diagonal" do
		context "will return false" do
			it "when not 4 in a row vertically" do
				test_symbol = "O"
				expect(test_board.check_diagonal(test_symbol)).to be false
			end
		end
	end


end