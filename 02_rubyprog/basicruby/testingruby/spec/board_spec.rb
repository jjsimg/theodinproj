require "board"




describe Board do
	let(:test_board) { Board.new }
	describe "#apply_choice" do
		context "writes 'O' in the array" do
			it "from player choice" do
				choice = 3
				expect(test_board.apply_choice(choice)).to eq('O')
			end
		end
	end

end