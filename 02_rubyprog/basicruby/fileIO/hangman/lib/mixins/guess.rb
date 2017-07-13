class Guess

  def initialize(secret_word)
    @secret_word = secret_word
    @guesses_remain = Hangman::MAX_GUESSES
    @wrong_guesses = Array.new
    @secret_show = Array.new(secret_word.size)
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
  end

  def check_secret
    @guess_letter = display_letters_guessed
    @secret_word.split("").each_with_index do |letter,idx|
      if @guess_letter == letter
        @secret_show[idx] = letter
      elsif @secret_show[idx] != nil
        next
      else
        @secret_show[idx] = '_'
      end
    end
    new_guess = @secret_show
    if @start_secret
      old_guess = 'initialize'
      @start_secret = false
    end
    if new_guess==old_guess
      @guesses_remain-=1
    end
    old_guess = new_guess
    puts @secret_word # Delete later
    puts @secret_show.join(" ") # Delete later
    @secret_show
  end

  def wrong_guesses
    if not @secret_word.split("").include? @guess_letter
      @wrong_guesses << @guess_letter
    end
    puts "Wrong guesses: #{@wrong_guesses}"
    @wrong_guesses
  end

end