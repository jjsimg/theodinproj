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
		if @@board[0]=="x" and @@board[1]=="x" and @@board[2]=="x"
		  true
		elsif @@board[3]=="x" and @@board[4]=="x" and @@board[5]=="x"
		  true
		elsif @@board[6]=="x" and @@board[7]=="x" and @@board[8]=="x"
		  true
		elsif @@board[0]=="x" and @@board[3]=="x" and @@board[6]=="x"
		  true
		elsif @@board[1]=="x" and @@board[4]=="x" and @@board[7]=="x"
      true
    elsif @@board[2]=="x" and @@board[5]=="x" and @@board[8]=="x"
      true
    elsif @@board[0]=="x" and @@board[4]=="x" and @@board[8]=="x"
      true
    elsif @@board[2]=="x" and @@board[4]=="x" and @@board[6]=="x"
      true
		elsif @@board[0]=="o" and @@board[1]=="o" and @@board[2]=="o"
		  true
		elsif @@board[3]=="o" and @@board[4]=="o" and @@board[5]=="o"
		  true
		elsif @@board[6]=="o" and @@board[7]=="o" and @@board[8]=="o"
		  true
    elsif @@board[0]=="o" and @@board[3]=="o" and @@board[6]=="o"
      true
    elsif @@board[1]=="o" and @@board[4]=="o" and @@board[7]=="o"
      true
    elsif @@board[2]=="o" and @@board[5]=="o" and @@board[8]=="o"
      true
    elsif @@board[0]=="o" and @@board[4]=="o" and @@board[8]=="o"
      true
    elsif @@board[2]=="o" and @@board[4]=="o" and @@board[6]=="o"
      true
    end
      false
	end
	
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
  game_over=false
  while game_over==false
    choice
    show
    game_over
  end
	# end
  if game_over
    puts "The game's over!"
  end
	
end

a=TicTacToe.new
