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
		CONNECT_FOUR_ROWS.each do |key, array|
			print "\t"
			print array.join("|") + "\n"
		end
	end

	def apply_choice(choice, player_symbol)
		# choice is a number between 1 and 7
		CONNECT_FOUR_ROWS.reverse_each do |key, array|
			return array[choice] = player_symbol if array[choice] != "O" and array[choice] != "X"
		end
	end


end