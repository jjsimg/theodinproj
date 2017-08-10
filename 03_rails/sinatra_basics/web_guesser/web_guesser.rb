require 'sinatra'
require 'sinatra/reloader'

@@random_num = rand(101)
@@guesses_remain = 30
@@game_over = false

def check_guess(guess) 
	if @@game_over
		@@random_num = rand(101)
		@@game_over = false
	end
	guess = guess.to_i
	if @@guesses_remain == 0
		@@guesses_remain = 30
		@@game_over = true
		return "You have run out of guesses!"
	end
	if guess == 0
		"Not a number! Enter an Integer!"
	elsif guess.between?(@@random_num-5, @@random_num+5) and guess < @@random_num
		@@guesses_remain += -1
		"Low! But you're close! You have #{@@guesses_remain} guesses remaining"
	elsif guess.between?(@@random_num-5, @@random_num+5) and guess > @@random_num
		@@guesses_remain += -1
		"High! But you're close! You have #{@@guesses_remain} guesses remaining"
	elsif guess < @@random_num
		@@guesses_remain += -1
		"Way Too Low! You have #{@@guesses_remain} guesses remaining"
	elsif guess > @@random_num
		@@guesses_remain += -1
		"Way Too High! You have #{@@guesses_remain} guesses remaining"
	elsif guess == @@random_num
		@@guesses_remain = 30
		@@gamve_over = true
		"Correct!"
	end
end

def get_colour(guess)
	guess = guess.to_i
	return "green" if guess == @@random_num
	return "indianred" if guess.between?(@@random_num-5, @@random_num+5)
	return "red" if guess < @@random_num or guess > @@random_num
end

get '/' do
	guess = params["guess"]
	message = check_guess(guess)
	colour = get_colour(guess)
	erb :index, :locals => { :random_num => @@random_num, :message => message, :colour => colour }
end
