require 'YAML'

class SaveGame
  def initialize(secret='default', guesses='default', wrong_guesses='default')
    @secret = secret
    @guesses = guesses
    @wrong_guesses = wrong_guesses
  end
	
  def save_file
    @save = File.open('game_save.yaml','w')
    @save.print YAML::dump(@secret)
    @save.print YAML::dump(@guesses)
    @save.print YAML::dump(@wrong_guesses)
  end

  def load_file
  	begin
      array = Array.new
    	File.open('game_save.yaml','r').each do |line|
        array << YAML::load(line)
      end
      array.join("")
    rescue
      puts "File doesn't exist, cannot load game file"
    end
  end

end