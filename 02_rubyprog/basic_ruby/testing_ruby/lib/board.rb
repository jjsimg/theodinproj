class Board

	CONNECT_FOUR_ROWS = {
			              first:  ['_','_','_','_','_','_','_'],
			              second: ['_','_','_','_','_','_','_'],
			              third:  ['_','_','_','_','_','_','_'],
			              fourth: ['_','_','_','_','_','_','_'],
			              fifth:  ['_','_','_','_','_','_','_'],
			              sixth:  ['_','_','_','_','_','_','_'],
			            }

	def get_rows
		return CONNECT_FOUR_ROWS
	end

	def draw_board
		label_row = "1 2 3 4 5 6 7"
		print "\t" + label_row + "\n"
		CONNECT_FOUR_ROWS.each do |key, board_array|
			print "\t"
			print board_array.join("|") + "\n"
		end
	end

	def apply_choice(choice, player_symbol)
		# choice is a number between 1 and 7
		CONNECT_FOUR_ROWS.reverse_each do |key, board_array|
			return board_array[choice] = player_symbol if board_array[choice] != "O" and board_array[choice] != "X"
		end
	end

	def check_horizontal(player_symbol)
		CONNECT_FOUR_ROWS.each do |key, array|
			4.times do |i|
				if array[i] == player_symbol and array[i+1] == player_symbol and array[i+2] == player_symbol and array [i+3] == player_symbol
			    	return true
				end
			end
		end
		false
	end

	def check_vertical
	end

	def check_diagonal
	end

end