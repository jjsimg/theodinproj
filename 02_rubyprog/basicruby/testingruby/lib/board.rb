class Board

	# "_-_-_-_-_-_-_"
    # "_-_-_-_-_-_-_"
    # "_-_-O-_-_-_-_"
    # "_-_-E-O-_-_-_"
    # "_-_-E-E-O-_-_"
    # "_-_-E-E-E-O-_"

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

	def draw_initial_board
		print "\t"
		label_row = "1 2 3 4 5 6 7"
		            
	end

	def apply_choice(choice)
		# choice is a number between 1 and 7
		CONNECT_FOUR_ROWS.reverse_each do |key, array|
			return array[choice] = 'O' if array[choice] != 'O'
		end
	end


end