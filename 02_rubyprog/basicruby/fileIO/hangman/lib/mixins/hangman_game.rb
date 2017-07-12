class HangmanGame


	def play
    # if file isn't already open
		@dict = File.open('sample_dictionary.txt','r')
    welcome_message
    check_save
    if check_save
      load_game
    else
      new_game
    end
    show
    show
    show
	end

  def check_save
    if @selection == 'Y' or @selection =='y'
      true
    elsif @selection == 'N' or @selection == 'n'
      false
    end
  end

  def load_game
    @load_game = SaveGame.new
    @load_game.each_with_index do |line,idx|
      puts line if idx%1000==0
    end
  end

  def new_game
    puts "Computer is selecting a word..."
    @secret = get_word
    @guesses_left = Hangman::MAX_GUESSES
    @guessing = Guess.new
    sleep(0.5)
    puts "Word has been selected!"
    puts ""
  end

  def make_spaces(secret)
    
  end

  def show
    puts "========================="
    puts "========================="
    puts "*******  Hangman  *******"
    puts "========================="
    puts "========================="
    puts ""
    puts ""
    @guessing.display_secret(@secret, @guesses_left)
    @guessing.display_remaining_guesses
  end

  def get_word
    @dictlist=Array.new
    # dictionary_size = 61405
    dictionary_size = 27
    dictionary_random = rand(dictionary_size)
    @dict.each do |word|
      @dictlist << word
    end
    @dictlist[dictionary_random].chomp
  end

  def welcome_message
    puts ""
    puts ""
    puts "********************************"
    puts "*Welcome to the game of Hangman*"
    puts "********************************"
    puts ""
    puts ""
    puts "Do you want to load a saved game?"
    puts "(Y)es"
    puts "or"
    puts "(N)o"
    puts ""
    print "What is your selection? "
    @selection = gets.chomp
  end
end