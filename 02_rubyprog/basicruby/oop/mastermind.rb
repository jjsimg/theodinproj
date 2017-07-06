class Mastermind
  def initialize
  end

  def self.game_over
  end

  def self.welcome
    puts ""
    puts ""
    puts "----------------------------"
    puts "This is the Mastermind game."
    puts "----------------------------"
    puts ""
  end

  def self.gameboard
    puts ""
    puts "XXXXX--------"
    puts "ooooo--------"
    puts "ooooo--------"
    puts "ooooo--------"
    puts "ooooo--------"
    puts "ooooo--------"
    puts "ooooo--------"
    puts "ooooo--------"
    puts "ooooo--------"
    puts "ooooo--------"
    puts "ooooo--------"
    puts "ooooo--------"
    puts ""
  end

  def self.randomize
    blue=1
    red=2
    white=3
    violet=4
    orange=5
    green=6
    yellow=7
    @@mastermind=[]
    (1..5).each do |x|
      @@mastermind.push(rand(1..7))
    end
  end

  def self.choice
    puts "What colours would you like to select?"
    puts "Pick 5 colours out of: "
    puts "(b)lue"
    puts "(r)ed"
    puts "(w)hite"
    puts "(v)iolet"
    puts "(o)range"
    puts "(g)reen"
    puts "(y)ellow"
    puts "-----------------------------------------------"
    puts "Make sure to select letters separated by spaces"
    mychoice=gets.split
  end

  welcome
  gameboard
  randomize
  choice
end

