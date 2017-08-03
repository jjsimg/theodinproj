class ConnectFour
	def initialize
		@board = Board.new
	end

	def play
		welcome_message
		@board.draw_initial_board
	end

	def welcome_message
		print "Let's play Connect Four\n"
	end
end