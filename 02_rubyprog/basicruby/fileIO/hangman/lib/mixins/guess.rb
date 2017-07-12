class Guess
  def initialize
    @guesses = Array.new
    @secret_array = Array.new
  end

  def display_remaining_guesses
    # puts "Letters used: #{guess_letter}"
    puts ""
    print "What letter do you pick? "
    user_input = gets.chomp
    @guesses << user_input
  end

  def display_secret(secret_word, guesses_remaining)
    puts "Your number of guesses is: #{guesses_remaining}"
    secret = secret_word.split("")
    secret.each do
      @secret_array << "_" + " "
    end
    @secret_array.pop
    puts @secret_array.join
    puts ""
    puts ""
  end


  
end