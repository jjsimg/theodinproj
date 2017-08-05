require "board"




describe Board do

	let(:test_board) { Board.new }


	describe "#apply_choice" do
		context "places the correct symbol in the array" do
			it "and should be an 'X' if it is player 2's turn" do
				example_choice = 3
				example_symbol = "X"
				expect(test_board.apply_choice(example_choice, example_symbol)).to eq('X')
			end
		end
	end

	describe "#draw_board" do
		it "draws the board" do
			line = ["_","_","_","_","_","_","_"]
			line2 = ["_","_","_","X","_","_","_"]
			board_hash = {first: line, second: line, third: line,
						 fourth: line, fifth: line, sixth: line2}
			allow(test_board).to receive(:print).and_return("")
			expect(test_board.draw_board).to eq(board_hash)
		end
	end
end