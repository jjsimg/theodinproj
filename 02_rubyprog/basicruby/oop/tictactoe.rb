# class Choice
# 	def initialize(p1move)
# 		@@p1move=p1move
# 	end
# end

# class TicTacToe < Choice
# 	p1move=@@p1move
# 	def board
# 		board=[1,2,3,
# 					 4,5,6,
# 					 7,8,9]
# 	end

# 	def show
# 		puts "#{board[0]}"+"|"+"#{board[1]}"+"|"+"#{board[2]}"
# 		puts "-"+"-"+"-"+"-"+"-"
# 		puts "#{board[3]}"+"|"+"#{board[4]}"+"|"+"#{board[5]}"
# 		puts "-"+"-"+"-"+"-"+"-"
# 		puts "#{board[6]}"+"|"+"#{board[7]}"+"|"+"#{board[8]}"
# 	end

# 	def self.win?

# 	end

# 	puts "Are you ready to play Tic Tac Toe?"
# 	puts "Player 1, where would you like to go?"

# 	if @@p1move<=9 and @@p1move>=1 and board[@@p1move]!='x'
# 		board[@p1move]=x
# 	end
# end


# game1=TicTacToe.new
# game1.show
def board
	board=[1,2,3,
				 4,5,6,
				 7,8,9]
end

def show
	puts "#{board[0]}"+"|"+"#{board[1]}"+"|"+"#{board[2]}"
	puts "-"+"-"+"-"+"-"+"-"
	puts "#{board[3]}"+"|"+"#{board[4]}"+"|"+"#{board[5]}"
	puts "-"+"-"+"-"+"-"+"-"
	puts "#{board[6]}"+"|"+"#{board[7]}"+"|"+"#{board[8]}"
end

puts "Let's play Tic Tac Toe."
show

puts "Player 1, you are x."
puts "Give me your choice of where to go: "
p1move=gets.chomp
