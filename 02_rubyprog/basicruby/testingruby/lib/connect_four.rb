class ConnectFour
	def initialize
		@board = Board.new
	end

	def play
		welcome_message
		choice = pick_column

		@board.apply_choice(choice)
		print @board.get_rows
		print @board.get_rows[:sixth].join("-")
	end

	def welcome_message
		print "Let's play Connect Four\n"
	end

	def choose_players
	end

	def pick_column
		choice_range = [1, 2, 3, 4, 5, 6, 7]
		prompt = "Please choose a column: "
		get_choice(prompt, choice_range)
	end

	def get_choice(prompt_question, choice_range)
		loop do
			print prompt_question
			user_choice = gets.chomp.to_i
			return user_choice - 1 if choice_range.include? user_choice
		end
	end
end