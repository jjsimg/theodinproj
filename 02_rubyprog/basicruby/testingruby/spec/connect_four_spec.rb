require "connect_four"
require "connect_four_game"
require "board"

describe ConnectFour do
	let(:test_game) { ConnectFour.new }

	describe "#welcome_message" do
		it "outputs the welcome message" do
			message = "Let's play Connect Four\n"
			expect(test_game.welcome_message).to output(message).to_stdout
		end
	end


end

