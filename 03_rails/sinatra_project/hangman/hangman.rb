require 'sinatra'
require 'sinatra/reloader'

class Hangman
	def play
		"You are playing Hangman"
	end
end

game = Hangman.new

get '/' do
	secret_message = game.play
	erb :index, :locals => { :secret_message => secret_message }
end