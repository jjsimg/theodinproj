class HangmanGame



	def play
    # if file isn't already open
		@dict = File.open('dictionary.txt','r')
    welcome_message
    new_game?
    
    if save_game?
      #serialize inputs
    end
	end

  def new_game?
    if @selection == 'Y' or @selection =='y'
      #load saved game
    elsif @selection == 'N' or @selection == 'n'
      #start new game
  end

  def save_game?
    if player selects 'Y' or 'y'
      true
    else
      false
    end
  end

  def pick_word
    @secret = @dict.rand(size of dictionary)
  end


  def display_choice

  end

  def init_word
    word_length = @secret.size
    (1..word_length).each do |_|
      puts "_"+" "
    end
  end

  def welcome_message
    puts ""
    puts ""
    puts "********************************"
    puts "*Welcome to the game of Hangman*"
    puts "********************************"
    puts "="
    puts "="
    puts "Do you want to load a saved game?"
    puts "(Y)es"
    puts "or"
    puts "(N)o"
    puts ""
    puts ""
    puts ""
    @selection = gets.chomp
  end
end