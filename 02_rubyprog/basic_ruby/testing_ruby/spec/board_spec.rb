require "board"




describe Board do

	let(:test_board) { Board.new }


	describe "#apply_choice" do
		context "places the correct symbol in the array" do
			it "and should be an 'X' if it is player 2's turn" do
				example_choice = 0
				example_symbol = "X"
				expect(test_board.apply_choice(example_choice, example_symbol)).to eq('X')
			end
			it "will place an 'X' three times consecutively in a row" do
				example_choice1 = 1
				example_choice2 = 2
				example_choice3 = 3
				example_symbol = "X"
				expect(test_board.apply_choice(example_choice1, example_symbol)).to eq('X')
				expect(test_board.apply_choice(example_choice2, example_symbol)).to eq('X')
				expect(test_board.apply_choice(example_choice3, example_symbol)).to eq('X')
			end
		end
	end

	describe "#draw_board" do
		it "draws the board" do
			line = ["_","_","_","_","_","_","_"]
			line2 = ["X","X","X","X","_","_","_"]
			board_hash = {first: line, second: line, third: line,
						 fourth: line, fifth: line, sixth: line2}
			allow(test_board).to receive(:print).and_return("")
			expect(test_board.draw_board).to eq(board_hash)
		end
	end

	describe "#check_horizontal" do
		context "will return true" do
			it "when 4 in a row horizontally" do
				test_symbol = "X"
				expect(test_board.check_horizontal(test_symbol)).to be true
			end
		end
		context "will return false" do
			it "when not 4 in a row horizontally" do
				test_symbol = "O"
				expect(test_board.check_horizontal(test_symbol)).to be false
			end
		end
	end

end