require 'sinatra'
require 'sinatra/reloader'

number = 4

get '/' do
	secret_message = params["secret"]
	erb :index, :locals => { :number => number }
end