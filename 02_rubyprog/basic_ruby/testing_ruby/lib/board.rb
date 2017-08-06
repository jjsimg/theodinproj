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
		CONNECT_FOUR_ROWS.each do |key, board_array|
			4.times do |i|
				if board_array[i] == player_symbol and board_array[i+1] == player_symbol and board_array[i+2] == player_symbol and board_array [i+3] == player_symbol
			    	return true
				end
			end
		end
		false
	end

	def check_vertical(player_symbol, choice)
		# column
		check_array = []
		CONNECT_FOUR_ROWS.each do |key, board_array|
			check_array << board_array[choice]
			return true if check_array.count(player_symbol) == 4
		end
		false
	end

	def check_diagonal(player_symbol)
		check_array_f = []
		check_array_b = []
		# forward diagonal
		loop do
			i = 0
			CONNECT_FOUR_ROWS.each do |key, board_array|
				# case key
				# when :first
				# 	counter = 0
				# when :second
				# 	counter = 1
				# when :third
				# 	counter = 2
				# when :fourth
				# 	counter = 3
				# end
				# 4.times do
				# 	check_array_f << board_array[counter]
				# 	counter += 1
				# end
				# return true if check_array_f.count(player_symbol) == 4
				check_array_f << board_array[i]
				i += 1
				next
			end
			check_array_f = []
			return true if check_array_f.count(player_symbol) == 4
		end

		#forward diagonal
		if CONNECT_FOUR_ROWS[:first][0] == player_symbol and CONNECT_FOUR_ROWS[:second][1] == player_symbol and CONNECT_FOUR_ROWS[:third][2] == player_symbol and CONNECT_FOUR_ROWS[:fourth][3] == player_symbol
			return true
		end
		if CONNECT_FOUR_ROWS[:first][1] == player_symbol and CONNECT_FOUR_ROWS[:second][2] == player_symbol and CONNECT_FOUR_ROWS[:third][3] == player_symbol and CONNECT_FOUR_ROWS[:fourth][4] == player_symbol
			return true
		end
		if CONNECT_FOUR_ROWS[:first][2] == player_symbol and CONNECT_FOUR_ROWS[:second][3] == player_symbol and CONNECT_FOUR_ROWS[:third][4] == player_symbol and CONNECT_FOUR_ROWS[:fourth][5] == player_symbol
			return true
		end
		if CONNECT_FOUR_ROWS[:first][3] == player_symbol and CONNECT_FOUR_ROWS[:second][4] == player_symbol and CONNECT_FOUR_ROWS[:third][5] == player_symbol and CONNECT_FOUR_ROWS[:fourth][6] == player_symbol
			return true
		end


		if CONNECT_FOUR_ROWS[:second][0] == player_symbol and CONNECT_FOUR_ROWS[:third][1] == player_symbol and CONNECT_FOUR_ROWS[:fourth][2] == player_symbol and CONNECT_FOUR_ROWS[:fifth][3] == player_symbol
			return true
		end
		if CONNECT_FOUR_ROWS[:second][1] == player_symbol and CONNECT_FOUR_ROWS[:third][2] == player_symbol and CONNECT_FOUR_ROWS[:fourth][3] == player_symbol and CONNECT_FOUR_ROWS[:fifth][4] == player_symbol
			return true
		end
		if CONNECT_FOUR_ROWS[:second][2] == player_symbol and CONNECT_FOUR_ROWS[:third][3] == player_symbol and CONNECT_FOUR_ROWS[:fourth][4] == player_symbol and CONNECT_FOUR_ROWS[:fifth][5] == player_symbol
			return true
		end
		if CONNECT_FOUR_ROWS[:second][3] == player_symbol and CONNECT_FOUR_ROWS[:third][4] == player_symbol and CONNECT_FOUR_ROWS[:fourth][5] == player_symbol and CONNECT_FOUR_ROWS[:fifth][6] == player_symbol
			return true
		end

		if CONNECT_FOUR_ROWS[:third][0] == player_symbol and CONNECT_FOUR_ROWS[:fourth][1] == player_symbol and CONNECT_FOUR_ROWS[:fifth][2] == player_symbol and CONNECT_FOUR_ROWS[:sixth][3] == player_symbol
			return true
		end
		if CONNECT_FOUR_ROWS[:third][1] == player_symbol and CONNECT_FOUR_ROWS[:fourth][2] == player_symbol and CONNECT_FOUR_ROWS[:fifth][3] == player_symbol and CONNECT_FOUR_ROWS[:sixth][4] == player_symbol
			return true
		end
		if CONNECT_FOUR_ROWS[:third][2] == player_symbol and CONNECT_FOUR_ROWS[:fourth][3] == player_symbol and CONNECT_FOUR_ROWS[:fifth][4] == player_symbol and CONNECT_FOUR_ROWS[:sixth][5] == player_symbol
			return true
		end
		if CONNECT_FOUR_ROWS[:third][3] == player_symbol and CONNECT_FOUR_ROWS[:fourth][4] == player_symbol and CONNECT_FOUR_ROWS[:fifth][5] == player_symbol and CONNECT_FOUR_ROWS[:sixth][6] == player_symbol
			return true
		end




		# #backward diagonal
		# if CONNECT_FOUR_ROWS[:first][3] == player_symbol and CONNECT_FOUR_ROWS[:second][2] == player_symbol and CONNECT_FOUR_ROWS[:third][1] == player_symbol and CONNECT_FOUR_ROWS[:fourth][0] == player_symbol
		# 	return true
		# end
		# if CONNECT_FOUR_ROWS[:first][4] == player_symbol and CONNECT_FOUR_ROWS[:second][3] == player_symbol and CONNECT_FOUR_ROWS[:third][2] == player_symbol and CONNECT_FOUR_ROWS[:fourth][1] == player_symbol
		# 	return true
		# end
		# if CONNECT_FOUR_ROWS[:first][5] == player_symbol and CONNECT_FOUR_ROWS[:second][4] == player_symbol and CONNECT_FOUR_ROWS[:third][3] == player_symbol and CONNECT_FOUR_ROWS[:fourth][2] == player_symbol
		# 	return true
		# end
		# if CONNECT_FOUR_ROWS[:first][6] == player_symbol and CONNECT_FOUR_ROWS[:second][5] == player_symbol and CONNECT_FOUR_ROWS[:third][4] == player_symbol and CONNECT_FOUR_ROWS[:fourth][3] == player_symbol
		# 	return true
		# end

		# if CONNECT_FOUR_ROWS[:second][3] == player_symbol and CONNECT_FOUR_ROWS[:third][2] == player_symbol and CONNECT_FOUR_ROWS[:fourth][1] == player_symbol and CONNECT_FOUR_ROWS[:fifth][0] == player_symbol
		# 	return true
		# end
		# if CONNECT_FOUR_ROWS[:second][4] == player_symbol and CONNECT_FOUR_ROWS[:third][3] == player_symbol and CONNECT_FOUR_ROWS[:fourth][2] == player_symbol and CONNECT_FOUR_ROWS[:fifth][1] == player_symbol
		# 	return true
		# end
		# if CONNECT_FOUR_ROWS[:second][5] == player_symbol and CONNECT_FOUR_ROWS[:third][4] == player_symbol and CONNECT_FOUR_ROWS[:fourth][3] == player_symbol and CONNECT_FOUR_ROWS[:fifth][2] == player_symbol
		# 	return true
		# end
		# if CONNECT_FOUR_ROWS[:second][6] == player_symbol and CONNECT_FOUR_ROWS[:third][5] == player_symbol and CONNECT_FOUR_ROWS[:fourth][4] == player_symbol and CONNECT_FOUR_ROWS[:fifth][3] == player_symbol
		# 	return true
		# end

		# if CONNECT_FOUR_ROWS[:third][3] == player_symbol and CONNECT_FOUR_ROWS[:fourth][2] == player_symbol and CONNECT_FOUR_ROWS[:fifth][1] == player_symbol and CONNECT_FOUR_ROWS[:sixth][0] == player_symbol
		# 	return true
		# end
		# if CONNECT_FOUR_ROWS[:third][4] == player_symbol and CONNECT_FOUR_ROWS[:fourth][3] == player_symbol and CONNECT_FOUR_ROWS[:fifth][2] == player_symbol and CONNECT_FOUR_ROWS[:sixth][1] == player_symbol
		# 	return true
		# end
		# if CONNECT_FOUR_ROWS[:third][5] == player_symbol and CONNECT_FOUR_ROWS[:fourth][4] == player_symbol and CONNECT_FOUR_ROWS[:fifth][3] == player_symbol and CONNECT_FOUR_ROWS[:sixth][2] == player_symbol
		# 	return true
		# end
		# if CONNECT_FOUR_ROWS[:third][6] == player_symbol and CONNECT_FOUR_ROWS[:fourth][5] == player_symbol and CONNECT_FOUR_ROWS[:fifth][4] == player_symbol and CONNECT_FOUR_ROWS[:sixth][3] == player_symbol
		# 	return true
		# end
		false
	end

end