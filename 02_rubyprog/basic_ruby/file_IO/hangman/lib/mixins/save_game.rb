require 'YAML'

class SaveGame
  def initialize(secret='default', guesses='default', wrong_guesses='default')
    @secret = secret
    @guesses = guesses
    @wrong_guesses = wrong_guesses
  end
	
  def save_file
    @save = File.open('game_save.yaml','w') do |file|
      file.print YAML::dump(@secret)
      file.print YAML::dump(@guesses)
      file.print YAML::dump(@wrong_guesses)
    end
  end

  def load_file
  	begin
      array = YAML::load_stream(File.open('game_save.yaml'))
    rescue
      puts "File doesn't exist, cannot load game file"
    end
  end

end