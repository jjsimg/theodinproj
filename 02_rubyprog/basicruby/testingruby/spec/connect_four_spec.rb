require "connect_four"
require "connect_four_game"
require "board"

describe ConnectFour do
	let(:test_game) { ConnectFour.new }

	describe "#welcome_message" do
		it "outputs the welcome message" do
			expect(test_game.welcome_message).to eq("Let's play Connect Four")
		end
	end
end