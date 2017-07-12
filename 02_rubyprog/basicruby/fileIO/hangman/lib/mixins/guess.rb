class Guess

  def initialize(secret_word)
    @secret_word = secret_word
    @wrong_guesses = Array.new
    @secret_show = Array.new(secret_word.size)
  end

  def display_letters_guessed
    # puts "Letters used: #{guess_letter}"
    puts ""
    print "What letter will you pick? "
    user_input = gets.chomp
  end

  def display_remaining_guesses(guess_remain)
    puts "Your number of guesses is: #{guess_remain}"
  end

  def check_secret
    @guess_letter = display_letters_guessed
    @secret_word.split("").each_with_index do |letter,idx|
      if @guess_letter == letter
        @secret_show[idx] = letter
      elsif @secret_show[idx] != nil and @secret_show[idx] != '_'
        next
      else
        @secret_show[idx] = '_'
      end
    end
    puts @secret_word
    puts @secret_show.join(" ") # Delete later
    @secret_show
  end

  def wrong_guesses
    if not @secret_word.split("").include? @guess_letter
      @wrong_guesses << @guess_letter
    end
    puts "Wrong guesses: #{@wrong_guesses}"
  end

end