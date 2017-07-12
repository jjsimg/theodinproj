class HangmanGame



	def play
    # if file isn't already open
		@dict = File.open('sample_dictionary.txt','r')
    welcome_message
    get_selection
    check_save
    if check_save
      load_game
    else
      new_game
    end
    while still_guessing?
      banner
      calculate
      @guesses_left -= 1
      if player_win?
        winning_message
        break
      end
      if player_lose?
        losing_message
      end
    end
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
    @guessing = Guess.new(@secret)
    sleep(0.5)
    puts "Word has been selected!"
    puts ""
  end


  def banner
    puts "========================="
    puts "========================="
    puts "*******  Hangman  *******"
    puts "========================="
    puts "========================="
    puts ""
    puts ""
  end

  def calculate
    @guessing.display_remaining_guesses(@guesses_left)
    @updated_secret = @guessing.check_secret
    @guessing.wrong_guesses
    puts "here is the secret: #{@updated_secret}" # Delete later
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

  def still_guessing?
    unless @guesses_left == Hangman::MAX_GUESSES
      @updated_secret.each do |elem|
        false if elem=='_'
        break
      end
    end
    if @guesses_left > 0
      true
    end
  end

  def player_win?
    if @guesses_left>0 and not @updated_secret.include? '_'
      true
    end
  end

  def player_lose?
    true if @guesses_left==0
  end

  def winning_message
    puts "Congratulations! You win!"
  end

  def losing_message
    puts "You ran out of guesses! You lose!"
  end

  def welcome_message
    puts ""
    puts ""
    puts "********************************"
    puts "*Welcome to the game of Hangman*"
    puts "********************************"
    puts ""
    puts "Do you want to load a saved game?"
    puts "(Y)es"
    puts "or"
    puts "(N)o"
    puts ""
    print "What is your selection? "
  end

  def get_selection
    @selection = gets.chomp
  end
end