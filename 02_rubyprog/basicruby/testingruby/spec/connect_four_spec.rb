require "connect_four"

describe ConnectFour do


	let(:test_game) { ConnectFour.new }

	describe "#choose_players" do
		context "not infinitely loop" do
			it "if user choice is 1 or 2" do
				allow(test_game).to receive(:gets).and_return("2")
				expect(test_game.choose_players).to eq(2)
			end
		end
	end

	describe "#pick_column" do
		context "will only return an integer between 1 and 7" do
			it "will return 3 if user picks 3" do
				allow(test_game).to receive(:gets).and_return("3")
				expect(test_game.pick_column).to eq(3)
			end
			it "will return 6 if user picks 6" do
				allow(test_game).to receive(:gets).and_return("6")
				expect(test_game.pick_column).to eq(6)
			end
		end
	end

	describe "#change_players" do
		context "will change game symbols if 2 players are playing" do
			it "if player used 'O' then next will be 'X'" do
				expect(test_game.change_players).to eq("X")
			end
		end
	end
end


