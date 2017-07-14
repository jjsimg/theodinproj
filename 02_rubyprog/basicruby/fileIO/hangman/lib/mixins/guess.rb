class Guess

  def initialize(secret_word, guesses, wrong_guesses)
    @secret_word = secret_word
    @guesses = guesses
    @wrong_guesses = wrong_guesses
    @guesses_remain = Hangman::MAX_GUESSES
    @start_secret = true
  end

  def display_letters_guessed
    # puts "Letters used: #{guess_letter}"
    puts ""
    print "What letter will you pick? "
    user_input = gets.chomp
  end

  def display_remaining_guesses
    puts "Your number of guesses is: #{@guesses_remain}"
    @guesses_remain
  end

  def check_secret
    @guess_letter = display_letters_guessed
    @secret_word.split("").each_with_index do |letter,idx|
      if @guess_letter == letter
        @guesses[idx] = letter
      elsif @guesses[idx] != nil
        next
      else
        @guesses[idx] = '_'
      end
    end
    check_remaining_guesses
    puts @secret_word # Delete later
    puts @guesses.join(" ") # Delete later
    @guesses
  end

  def check_remaining_guesses
    tmp = @guesses
    new_guess = tmp
    if @start_secret
      @old_guess = 'initialize'
      @start_secret = false
    end
    print new_guess
    puts ""
    print @old_guess
    puts ""
    if new_guess==@old_guess
      @guesses_remain-=1
      puts "guessed wrong"
    end
    @old_guess = new_guess
  end

  def old_guess
  end

  def new_guess
  end

  def wrong_guesses
    if not @secret_word.split("").include? @guess_letter
      @wrong_guesses << @guess_letter
    end
    puts "Wrong guesses: #{@wrong_guesses}"
    @wrong_guesses
  end

end