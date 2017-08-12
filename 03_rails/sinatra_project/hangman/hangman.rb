require 'sinatra'
require 'sinatra/reloader'

class Hangman
	attr_reader :dictionary

	def initialize
		@dictionary = File.open('sample_dictionary.txt','r')
	end

	def play
		"You are playing Hangman"
	end
end

game = Hangman.new
dict = game.dictionary

get '/' do
	secret_message = game.dictionary
	erb :index, :locals => { :secret_message => secret_message }
end