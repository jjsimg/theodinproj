class SaveGame
  include 'YAML'

  def save(file)
    @save = File.open('game_save.yaml','w')
    @save = puts file
  end
end