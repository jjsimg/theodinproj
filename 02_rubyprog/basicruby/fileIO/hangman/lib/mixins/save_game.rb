require 'YAML'

class SaveGame

	
  def save(file)
    @save = File.open('game_save.yaml','w')
    @save = puts file
  end
end