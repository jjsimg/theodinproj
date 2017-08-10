require 'sinatra'
require 'sinatra/reloader'




get '/' do
	guess = params["guess"]
	message = check_guess(guess)
	colour = get_colour(guess)
	erb :index, :locals => { :random_num => @@random_num, :message => message, :colour => colour }
end