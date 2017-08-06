class Board


	CONNECT_FOUR_ROWS = [
			            	['_','_','_','_','_','_','_',],
			            	['_','_','_','_','_','_','_',],
			            	['_','_','_','_','_','_','_',],
			            	['_','_','_','_','_','_','_',],
			            	['_','_','_','_','_','_','_',],
			            	['_','_','_','_','_','_','_',],
			            ]

	def get_rows
		return CONNECT_FOUR_ROWS
	end

	def draw_board
		label_row = "1 2 3 4 5 6 7"
		print "\t" + label_row + "\n"
		CONNECT_FOUR_ROWS.each do |board_array|
			print "\t"
			print board_array.join("|") + "\n"
		end
	end

	def apply_choice(choice, player_symbol)
		# choice is a number between 1 and 7
		CONNECT_FOUR_ROWS.reverse_each do |board_array|
			return board_array[choice] = player_symbol if board_array[choice] == "_"
		end
	end

	def check_horizontal(player_symbol)
		check_array = []
		CONNECT_FOUR_ROWS.each do |board_array|
			4.times do |i|
				check_array << board_array[i]
				check_array << board_array[i+1]
				check_array << board_array[i+2]
				check_array << board_array[i+3]
				return true if check_array.count(player_symbol) == 4
				check_array = []
			end
		end
		false
	end

	def check_vertical(player_symbol, choice)
		# column
		check_array = []
		CONNECT_FOUR_ROWS.each do |board_array|
			check_array << board_array[choice]
			return true if check_array.count(player_symbol) == 4
		end
		false
	end

	def check_diagonal(player_symbol)

		
		#forward diagonal
		if CONNECT_FOUR_ROWS[0][0] == player_symbol and CONNECT_FOUR_ROWS[1][1] == player_symbol and CONNECT_FOUR_ROWS[2][2] == player_symbol and CONNECT_FOUR_ROWS[3][3] == player_symbol
			return true
		end
		if CONNECT_FOUR_ROWS[0][1] == player_symbol and CONNECT_FOUR_ROWS[1][2] == player_symbol and CONNECT_FOUR_ROWS[2][3] == player_symbol and CONNECT_FOUR_ROWS[3][4] == player_symbol
			return true
		end
		if CONNECT_FOUR_ROWS[0][2] == player_symbol and CONNECT_FOUR_ROWS[1][3] == player_symbol and CONNECT_FOUR_ROWS[2][4] == player_symbol and CONNECT_FOUR_ROWS[3][5] == player_symbol
			return true
		end
		if CONNECT_FOUR_ROWS[0][3] == player_symbol and CONNECT_FOUR_ROWS[1][4] == player_symbol and CONNECT_FOUR_ROWS[2][5] == player_symbol and CONNECT_FOUR_ROWS[3][6] == player_symbol
			return true
		end


		if CONNECT_FOUR_ROWS[1][0] == player_symbol and CONNECT_FOUR_ROWS[2][1] == player_symbol and CONNECT_FOUR_ROWS[3][2] == player_symbol and CONNECT_FOUR_ROWS[4][3] == player_symbol
			return true
		end
		if CONNECT_FOUR_ROWS[1][1] == player_symbol and CONNECT_FOUR_ROWS[2][2] == player_symbol and CONNECT_FOUR_ROWS[3][3] == player_symbol and CONNECT_FOUR_ROWS[4][4] == player_symbol
			return true
		end
		if CONNECT_FOUR_ROWS[1][2] == player_symbol and CONNECT_FOUR_ROWS[2][3] == player_symbol and CONNECT_FOUR_ROWS[3][4] == player_symbol and CONNECT_FOUR_ROWS[4][5] == player_symbol
			return true
		end
		if CONNECT_FOUR_ROWS[1][3] == player_symbol and CONNECT_FOUR_ROWS[2][4] == player_symbol and CONNECT_FOUR_ROWS[3][5] == player_symbol and CONNECT_FOUR_ROWS[4][6] == player_symbol
			return true
		end

		if CONNECT_FOUR_ROWS[2][0] == player_symbol and CONNECT_FOUR_ROWS[3][1] == player_symbol and CONNECT_FOUR_ROWS[4][2] == player_symbol and CONNECT_FOUR_ROWS[5][3] == player_symbol
			return true
		end
		if CONNECT_FOUR_ROWS[2][1] == player_symbol and CONNECT_FOUR_ROWS[3][2] == player_symbol and CONNECT_FOUR_ROWS[4][3] == player_symbol and CONNECT_FOUR_ROWS[5][4] == player_symbol
			return true
		end
		if CONNECT_FOUR_ROWS[2][2] == player_symbol and CONNECT_FOUR_ROWS[3][3] == player_symbol and CONNECT_FOUR_ROWS[4][4] == player_symbol and CONNECT_FOUR_ROWS[5][5] == player_symbol
			return true
		end
		if CONNECT_FOUR_ROWS[2][3] == player_symbol and CONNECT_FOUR_ROWS[3][4] == player_symbol and CONNECT_FOUR_ROWS[4][5] == player_symbol and CONNECT_FOUR_ROWS[5][6] == player_symbol
			return true
		end




		# #backward diagonal
		if CONNECT_FOUR_ROWS[0][3] == player_symbol and CONNECT_FOUR_ROWS[1][2] == player_symbol and CONNECT_FOUR_ROWS[2][1] == player_symbol and CONNECT_FOUR_ROWS[3][0] == player_symbol
			return true
		end
		if CONNECT_FOUR_ROWS[0][4] == player_symbol and CONNECT_FOUR_ROWS[1][3] == player_symbol and CONNECT_FOUR_ROWS[2][2] == player_symbol and CONNECT_FOUR_ROWS[3][1] == player_symbol
			return true
		end
		if CONNECT_FOUR_ROWS[0][5] == player_symbol and CONNECT_FOUR_ROWS[1][4] == player_symbol and CONNECT_FOUR_ROWS[2][3] == player_symbol and CONNECT_FOUR_ROWS[3][2] == player_symbol
			return true
		end
		if CONNECT_FOUR_ROWS[0][6] == player_symbol and CONNECT_FOUR_ROWS[1][5] == player_symbol and CONNECT_FOUR_ROWS[2][4] == player_symbol and CONNECT_FOUR_ROWS[3][3] == player_symbol
			return true
		end

		if CONNECT_FOUR_ROWS[1][3] == player_symbol and CONNECT_FOUR_ROWS[2][2] == player_symbol and CONNECT_FOUR_ROWS[3][1] == player_symbol and CONNECT_FOUR_ROWS[4][0] == player_symbol
			return true
		end
		if CONNECT_FOUR_ROWS[1][4] == player_symbol and CONNECT_FOUR_ROWS[2][3] == player_symbol and CONNECT_FOUR_ROWS[3][2] == player_symbol and CONNECT_FOUR_ROWS[4][1] == player_symbol
			return true
		end
		if CONNECT_FOUR_ROWS[1][5] == player_symbol and CONNECT_FOUR_ROWS[2][4] == player_symbol and CONNECT_FOUR_ROWS[3][3] == player_symbol and CONNECT_FOUR_ROWS[4][2] == player_symbol
			return true
		end
		if CONNECT_FOUR_ROWS[1][6] == player_symbol and CONNECT_FOUR_ROWS[2][5] == player_symbol and CONNECT_FOUR_ROWS[3][4] == player_symbol and CONNECT_FOUR_ROWS[4][3] == player_symbol
			return true
		end

		if CONNECT_FOUR_ROWS[2][3] == player_symbol and CONNECT_FOUR_ROWS[3][2] == player_symbol and CONNECT_FOUR_ROWS[4][1] == player_symbol and CONNECT_FOUR_ROWS[5][0] == player_symbol
			return true
		end
		if CONNECT_FOUR_ROWS[2][4] == player_symbol and CONNECT_FOUR_ROWS[3][3] == player_symbol and CONNECT_FOUR_ROWS[4][2] == player_symbol and CONNECT_FOUR_ROWS[5][1] == player_symbol
			return true
		end
		if CONNECT_FOUR_ROWS[2][5] == player_symbol and CONNECT_FOUR_ROWS[3][4] == player_symbol and CONNECT_FOUR_ROWS[4][3] == player_symbol and CONNECT_FOUR_ROWS[5][2] == player_symbol
			return true
		end
		if CONNECT_FOUR_ROWS[2][6] == player_symbol and CONNECT_FOUR_ROWS[3][5] == player_symbol and CONNECT_FOUR_ROWS[4][4] == player_symbol and CONNECT_FOUR_ROWS[5][3] == player_symbol
			return true
		end
		false
	end

end