require 'sinatra'
require 'sinatra/reloader'

random_num = rand(101)

def check_guess(guess, random_num)
	guess = guess.to_i
	if guess == ""
		"Enter an integer!"
	elsif guess.between?(random_num-5, random_num+5) and guess < random_num
		"Too Low!"
	elsif guess.between?(random_num-5, random_num+5) and guess > random_num
		"Too High!"
	elsif guess < random_num
		"Way Too Low!"
	elsif guess > random_num
		"Way Too High!"
	elsif guess == random_num
		"Correct!"
	end
end


get '/' do
	guess = params["guess"]
	message = check_guess(guess, random_num)
	erb :index, :locals => { :random_num => random_num, :message => message }
end
