class ConnectFour
	

	def initialize

	end

	def play
		@board = Board.new
		welcome_message
		draw_board
	end

	def welcome_message
		message = "Let's play Connect Four"
		print message
		message
	end

	def pick_column
		user_choice = get_choice
	end

	def get_choice
		print "Where would you like to go?"
		error_message = "That is not a valid entry"

		loop do
			user_choice = gets.chomp
			return user_choice if user_choice <= 6 and user_choice >= 1
			error_message
		end
	end

	def draw_board

		@board.display_top_separator

	end
	
end

