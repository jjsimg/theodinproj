require 'sinatra'
require 'sinatra/reloader'

RANDOM_NUM = rand(101)

def initialize
	@@guesses_remain = 5
end

def check_guess(guess)
	guess = guess.to_i
	if guess == 0
		"Not a number! Enter an Integer!"
	elsif guess.between?(RANDOM_NUM-5, RANDOM_NUM+5) and guess < RANDOM_NUM
		"Low! But you're close!"
	elsif guess.between?(RANDOM_NUM-5, RANDOM_NUM+5) and guess > RANDOM_NUM
		"High! But you're close"
	elsif guess < RANDOM_NUM
		@@guesses_remain += -1
		"Way Too Low!"
	elsif guess > RANDOM_NUM
		@@guesses_remain += -1
		"Way Too High!"
	elsif guess == RANDOM_NUM
		"Correct!"
	end
end

def get_colour(guess)
	guess = guess.to_i
	return "green" if guess == RANDOM_NUM
	return "indianred" if guess.between?(RANDOM_NUM-5, RANDOM_NUM+5)
	return "red" if guess < RANDOM_NUM or guess > RANDOM_NUM
end

def check_num_guesses
	if @@guesses == 0
		"No more guesses left"
	end
end

get '/' do
	guess = params["guess"]
	message = check_guess(guess)
	colour = get_colour(guess)
	message = check_num_guesses
	erb :index, :locals => { :random_num => RANDOM_NUM, :message => message, :colour => colour }
end
