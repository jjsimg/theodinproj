class Board

	ROWS = 6
	COLUMNS = 7
	HOLE_WIDTH = 3
	COLUMNS_CHECKER = {
		             first_column:  [], second_column: [], third_column: [], 
		             fourth_column: [], fifth_column:  [], sixth_column: [],
		             sevent_column: [],
			       }

	PIECES = { 
		       top_left:       "\u2554",   top_right:    "\u2557",   bottom_left:     "\u255a", 
		       bottom_right:   "\u255d",   horizontal:   "\u2550",   vertical:        "\u2551",
			   cross:          "\u256c",   top_divide:   "\u2566",   bottom_divide:   "\u2569",
			   right:          "\u2563",   left:         "\u2560", 
			 }

	COLORS = { 
		       blank: 0, red: 1, green: 2, yellow: 3,
	           blue: 4, magenta: 5, cyan: 6, white: 7, black: 8 
	         }


	def display_top_separator(width = HOLE_WIDTH, new_line = true, tab = true)
		display_separator_row(PIECES[:top_left], PIECES[:top_divide], PIECES[:top_right], width, new_line, tab)
		
	end

	def display_middle_separator(width = HOLE_WIDTH, new_line = true, tab = true)
		display_separator_row(PIECES[:left], PIECES[:cross], PIECES[:right], width, new_line, tab)
		
	end

	def display_bottom_separator(width = HOLE_WIDTH, new_line = true, tab = true)
		display_separator_row(PIECES[:left], PIECES[:bottom_divide], PIECES[:right], width, new_line, tab)
		
	end

	def display_legs(width = HOLE_WIDTH, new_line = true, tab = true)
		display_separator_row(PIECES[:bottom_divide], middle = " ", PIECES[:bottom_divide], width, new_line, tab, lastrow = true)
	end

	def display_choice_separator(width = HOLE_WIDTH, new_line = true, tab = true, choice = true)
		coloring = store_choice
		display_separator_row(PIECES[:vertical], PIECES[:vertical], PIECES[:vertical], width, new_line, tab, lastrow = false, choice = choice)

	end


	def display_separator_row(left, middle, right, width, new_line, tab, lastrow = false, choice = false)
		print "\t" if tab
		to_display = left
		COLUMNS.times do
			width.times { to_display += PIECES[:horizontal] } unless lastrow
			width.times { to_display += " " } if lastrow
			to_display += middle
		end
		to_display[-1] = right

		print to_display
		puts if new_line
	end

	def draw_board
		display_top_separator
		display_choice_separator
		(ROWS-1).times do
			display_middle_separator
			display_choice_separator
		end
		display_bottom_separator
		display_legs
	end

	def store_choice(picked_column)
		COLUMNS_CHECKER.each do |key|
			COLUMNS_CHECKER[key] = 'O' if COLUMNS_CHECKER[key].nil?
			colorize(text = " " * HOLE_WIDTH, COLORS[:red]) if COLUMNS_CHECKER[key] == 'O'
		end
	end

	def draw_choice()
	end

	def colorize(text, color_code)
		"\033[#{color_code}m#{text}\033[0m"
	end

	def get_color_code color
		return "1;31;41" if color == COLORS[:red]
		# return "1;32;42" if color == COLORS[:green]
		# return "1;33;43" if color == COLORS[:yellow]
		return "1;34;44" if color == COLORS[:blue]
		# return "1;35;45" if color == COLORS[:magenta]
		# return "1;36;46" if color == COLORS[:cyan]
		# return "1;37;47" if color == COLORS[:white]
		# return "1;30;40" if color == COLORS[:black]
		# return "0"
	end



end
