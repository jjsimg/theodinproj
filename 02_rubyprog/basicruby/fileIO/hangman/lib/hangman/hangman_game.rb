class HangmanGame



	def play
    # if file isn't already open
		@dict = File.open('dictionary.txt','r')
    welcome_message
    if save_game?
      #serialize inputs
    end
	end

  def save_game?
    if player selects 'Y' or 'y'
      true
    else
      false
  end

  def pick_word
    @dict.rand(size of dictionary)
  end

  def guess
  end


  def display_word

  end

  def welcome_message
    puts ""
    puts ""
    puts "Welcome to the game of Hangman"
    puts "Do you want to load a saved game?"
    puts "(Y)es"
    puts "or"
    puts "(N)o"
    puts ""
    puts ""
    puts ""
  end
end