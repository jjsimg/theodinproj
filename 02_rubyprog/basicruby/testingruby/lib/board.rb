class Board

	CONNECT_FOUR_ROWS = {
			              first:  [], second: [], third: [],
			              fourth: [], fifth:  [], sixth: [],
			             }

	def draw_initial_board
		print "\t"
		label_row = "1 2 3 4 5 6 7"
		print label_row + "\n"
		draw
		            # "_ _-_-_-_-_-_"
		            # "_-_-_-_-_-_-_"
		            # "_-_-O-_-_-_-_"
		            # "_-_-E-O-_-_-_"
		            # "_-_-E-E-O-_-_"
		            # "_-_-E-E-E-O-_"


	end

	def draw
		CONNECT_FOUR_ROWS.each do |key|
			line = ""
			CONNECT_FOUR_ROWS[key].each_with_index do |elem, idx|
				if CONNECT_FOUR_ROWS[key][idx] != 'O'
					line << "_"
				elsif CONNECT_FOUR_ROWS[key][idx] == 'O'
					next
				end
			end
			CONNECT_FOUR_ROWS[key] = line
			print CONNECT_FOUR_ROWS[key]
			puts ""
		end
	end

end