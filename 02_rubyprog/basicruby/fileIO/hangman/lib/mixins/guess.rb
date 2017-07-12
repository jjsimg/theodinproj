class Guess

  def initialize(secret_word)
    @secret_word = secret_word
    @wrong_guesses = Array.new
  end

  def display_letters_guessed
    # puts "Letters used: #{guess_letter}"
    puts ""
    print "What letter will you pick? "
    user_input = gets.chomp
  end

  def display_remaining(guesses_remaining)
    puts "Your number of guesses is: #{guesses_remaining}"
  end

  def check_secret
    secret = String.new
    guess_letter = display_letters_guessed
    @secret_word.split("").each do |letter|
      if guess_letter == letter
        secret << letter + " "
      else
        secret << '_' + " "
      end
    end
    puts secret.chomp
    puts @secret_word # Delete later
    if not @secret_word.split("").include? guess_letter
      @wrong_guesses << guess_letter
    end
  end

end