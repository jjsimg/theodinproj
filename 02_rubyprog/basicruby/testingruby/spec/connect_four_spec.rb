require "connect_four"

describe ConnectFour do
	let(:test_game) { ConnectFour.new }

	before(:each) do
		allow(test_game).to receive(:gets)
	end
	# This does not properly check the print statement
	describe "#welcome_message" do
		it "outputs the welcome message" do
			message = "Let's play Connect Four!\n"
			allow(test_game).to receive(:print).and_return(message)
		end
	end


	describe "#get_choice" do
		context "it will inifinitely loop" do
			it "until a number is selected" do
				prompt = "Which column will you select?"
				choice_range = [1,2,3,4,5,6,7]
				allow(test_game.get_choice(prompt, choice_range)).to receive(:gets).and_return(1,2,3,4,5,6,7)
			end
		end
	end

	# This does not work either
	# describe "#get_choice" do
	# 	context "will accept prompts and return appropriate user input" do
	# 		describe "#choose_players" do
	# 			it "will accept either 1 or 2 as input" do
	# 				allow(test_game).to receive(:gets).and_return("1", "2")
	# 			end
	# 		end
	# 		describe "#pick_column" do
	# 			it "will accept inputs between 1 and 7" do
	# 				allow(test_game).to receive(:gets).and_return("1","2","3","4","5","6","7")
	# 			end
	# 		end
	# 	end
	# end

end


