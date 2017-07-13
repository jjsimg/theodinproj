require 'YAML'

class SaveGame
  def initialize(game_file)
    @game_file = game_file
  end
	
  def save(file)
    @save = File.open('game_save.yaml','w')
    @save = puts game_file
  end
end