class ConnectFour
	

	def initialize

	end

	def play
		@board = Board.new
		welcome_message
		make_board

		# choose_players


		# player_choice = pick_column
		# @board.store_choice(player_choice)
	end

	def welcome_message
		message = "Let's play Connect Four\n"
		print message
	end

	def choose_players
		choice_range = [1, 2]
		prompt_question = "How many human players will play? ( 1 or 2 ): "
		user_choice = get_choice(prompt_question, choice_range)
	end

	def make_board
		# @board.display_top_separator
		@board.draw_board
	end

	def pick_column
		choice_range = [1, 2, 3, 4, 5, 6, 7]
		prompt_question = "Which column would you like to select? ( Between 1 and 7 ) "
		user_choice = get_choice(prompt_question, choice_range)
	end

	# def get_choice(prompt_question, choice_range)

	# 	loop do
	# 		print prompt_question
	# 		user_choice = gets.chomp.to_i
	# 		# user_choice = 4
	# 		return user_choice if choice_range.include? user_choice
	# 	end
	# end
	
end

