class Board
	ROWS = 6
	COLUMNS = 7
	HOLE_WIDTH = 3
	PIECES = { 
		       top_left:       "\u2554",   top_right:    "\u2557",   bottom_left:     "\u255a", 
		       bottom_right:   "\u255d",   horizontal:   "\u2550",   vertical:        "\u2551",
			   cross:          "\u256c",   top_divide:   "\u2566",   bottom_divide:   "\u2569",
			   right:          "\u2563",   left:         "\u2560", 
			  }

	def self.display_row(separator = PIECES[:vertical], width = HOLE_WIDTH, tab = true)
		print "\t" if tab

		to_display = separator

		COLUMNS.times do
			width.times { to_display += " " }
			to_display += PIECES[:vertical]
		end
		print to_display
	end

	def self.display_top_separator(width = HOLE_WIDTH, new_line = true, tab = true)
		display_separator_row(PIECES[:top_left], PIECES[:top_divide], PIECES[:top_right], width, new_line, tab)
		
	end

	def self.display_middle_separator(width = HOLE_WIDTH, new_line = true, tab = true)
		display_separator_row(PIECES[:left], PIECES[:cross], PIECES[:right], width, new_line, tab)
		
	end

	def self.display_bottom_separator(width = HOLE_WIDTH, new_line = true, tab = true)
		display_separator_row(PIECES[:bottom_left], PIECES[:bottom_divide], PIECES[:bottom_right], width, new_line, tab)
		
	end

	def self.display_separator_row(left, middle, right, width, new_line, tab)
		print "\t" if tab
		to_display = left
		COLUMNS.times do
			width.times { to_display += PIECES[:horizontal] }
			to_display += middle
		end
		to_display[-1] = right

		print to_display
		puts if new_line
	end

end

# Board.display_bottom_separator