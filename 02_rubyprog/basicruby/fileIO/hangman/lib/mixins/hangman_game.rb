class HangmanGame



	def play
    # if file isn't already open
		@dict = File.open('sample_dictionary.txt','r')
    welcome_message
    get_selection
    start_game
    while still_guessing?
      banner
      calculate
      if player_win?
        winning_message
        break
      end
      if player_lose?
        losing_message
      end
      break if ask_to_save?
    end
	end

  def ask_to_save?
    print "Would you like to save? "
    user_input = gets.chomp
    if user_input=='Y' or user_input=='y'
      s_file = @secret
      g_file = @updated_secret.join
      w_file = @wrong_guesses.join
      save_file = SaveGame.new(s_file, g_file, w_file)
      save_file.save_file
      puts "Game is saved!"
      true
    elsif user_input=='N' or user_input=='n'
      false
    end
  end

  def start_game
    puts "Computer is selecting a word..."
    if @selection=='Y' or @selection == 'y'
      @arr = SaveGame.new.load_file
      @secret = @arr[0]
    elsif @selection=='N' or @selection == 'n'
      @secret = get_word
    end
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
    @guessing.display_remaining_guesses
    if @selection=='Y' or @selection=='y'
      @updated_secret = @arr[1].split("")
      @wrong_guesses = @arr[2].split("")
    elsif @selection=='N' or @selection=='n'
      @updated_secret = @guessing.check_secret
      @wrong_guesses = @guessing.wrong_guesses
    end
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
    if @selection == 'Y' or @selection =='y'
      true
    elsif @selection == 'N' or @selection == 'n'
      false
    end
  end
end