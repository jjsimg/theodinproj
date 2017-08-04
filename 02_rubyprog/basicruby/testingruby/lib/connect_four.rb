class ConnectFour
	attr_accessor :player_symbol

	def initialize
		@board = Board.new
		@player_symbol = "O"
	end

	def play
		welcome_message
		number_of_players = choose_players
		make_moves(number_of_players)
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
		until game_over?
			choice = pick_column - 1
			if number_of_players == 1
				@board.apply_choice(choice, @player_symbol)
				@board.draw_board
			else
				@board.apply_choice(choice, @player_symbol)
				@board.draw_board
				change_players
			end
		end
	end

	def change_players
		@player_symbol == "O" ? @player_symbol = "X" : @player_symbol = "O"
	end

	def game_over?
		false

	end

	def player_win?
	end
end