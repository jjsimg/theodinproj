require 'sinatra'
require 'sinatra/reloader'

class Hangman
	attr_reader :dictionary

	def initialize
		@dictionary = File.open('sample_dictionary.txt','r')
	end

	def get_word
		File.readlines('sample_dictionary.txt').sample
	end

	def play
		"You are playing Hangman"
	end
end

game = Hangman.new


enable :sessions

get '/' do
	# secret_message = game.get_word
	@session = session
	secret_message = @session
	erb :index, :locals => { :secret_message => secret_message }
end