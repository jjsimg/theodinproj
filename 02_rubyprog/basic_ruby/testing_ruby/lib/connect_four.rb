class ConnectFour
	attr_accessor :player_symbol

	def initialize
		@board = Board.new
		@player_symbol = "O"
		@choice = nil
	end

	def play
		welcome_message
		number_of_players = choose_players
		make_moves(number_of_players)

		game_finished_message
	end

	def welcome_message
		print "Let's play Connect Four!\n"
	end


	def pick_column
		choice_range = [1, 2, 3, 4, 5, 6, 7]
		prompt = "Please choose a column: "
		get_choice(prompt, choice_range)
	end

	def choose_players
		choice_range = [1, 2]
		prompt = "How many players will play? "
		get_choice(prompt, choice_range)
	end

	def get_choice(prompt_question, choice_range)
		loop do
			print prompt_question
			user_choice = gets.chomp.to_i
			return user_choice if choice_range.include? user_choice
		end
	end

	def make_moves(number_of_players)
		loop do
			@choice = pick_column - 1
			@board.apply_choice(@choice, @player_symbol)
			@board.draw_board
			return if game_over?
			change_players if number_of_players == 2
		end
	end

	def change_players
		@player_symbol == "O" ? @player_symbol = "X" : @player_symbol = "O"
	end

	def game_over?
		check_vertical = @board.check_vertical(@player_symbol, @choice)
		check_diagonal = @board.check_diagonal(@player_symbol)
		check_horizontal = @board.check_horizontal(@player_symbol)

		check_vertical or check_diagonal or check_horizontal ? true : false
	end


	def game_finished_message
		if @player_symbol == "O"
			player_1_victory = "Congratulations Player 1, you win!"
		end
		if @player_symbol == "X"
			player_2_victory = "Congratulations Player 2, you win!"
		end

		print "Game is finished!\n"
		print player_1_victory or player_2_victory
	end
end