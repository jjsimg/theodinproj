class TicTacToe

	@@board=[0,1,2,
			     3,4,5,
			     6,7,8]

	def self.show
		puts ""
		puts ""
		puts "#{@@board[0]}"+"|"+"#{@@board[1]}"+"|"+"#{@@board[2]}"
		puts "-"+"-"+"-"+"-"+"-"
		puts "#{@@board[3]}"+"|"+"#{@@board[4]}"+"|"+"#{@@board[5]}"
		puts "-"+"-"+"-"+"-"+"-"
		puts "#{@@board[6]}"+"|"+"#{@@board[7]}"+"|"+"#{@@board[8]}"
		puts ""
		puts ""
	end

	def self.welcome
		puts ""
		puts ""
		puts ""
		puts "Let's play Tic Tac Toe."
		show
		puts "Player 1, you are x."
		puts ""
		puts "Player 2, you are o."
		puts ""
		puts ""
	end

	def self.game_over

	end
	# Loop through this
	def self.choice
		p1="x"
		p2="o"
		xcount=@@board.count("x")
		ocount=@@board.count("o")
		print "Give me your choice of where to go: "
		move=gets.chomp.to_i
		@@board[move]="o" if xcount>ocount
		@@board[move]="x" if xcount==ocount
	end
	
	welcome
	# until game_over
	choice
	show
	choice
	show
	choice
	show
	choice
	show
	# end
	
end

a=TicTacToe.new
