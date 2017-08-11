require 'sinatra'
require 'sinatra/reloader'

def caesar(message_to_encrypt, shift = 1)
	alphabet = Array('a'..'z')
	non_caps = Hash[alphabet.zip(alphabet.rotate(shift))]
	alphabet = Array('A'..'Z')
	caps = Hash[alphabet.zip(alphabet.rotate(shift))]
	encrypter = non_caps.merge(caps)
	message_to_encrypt.chars.map { |c| encrypter.fetch(c, c) }.join
end

get '/' do
	message_to_encrypt = params["secret"]
	shift = rand(26)
	secret_message = caesar(message_to_encrypt, shift)
	erb :index, :locals => { :secret_message => secret_message }
end