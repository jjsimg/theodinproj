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

    # puts ""
    # puts "    "+"X-X-X-X-X----------"
    # puts "    "+"o-o-o-o-o----------"
    # puts "    "+"o-o-o-o-o----------"
    # puts "    "+"o-o-o-o-o----------"
    # puts "    "+"o-o-o-o-o----------"
    # puts "    "+"o-o-o-o-o----------"
    # puts "    "+"o-o-o-o-o----------"
    # puts "    "+"o-o-o-o-o----------"
    # puts "    "+"o-o-o-o-o----------"
    # puts "    "+"o-o-o-o-o----------"
    # puts "    "+"o-o-o-o-o----------"
    # puts ""

  def self.gameboard
    puts ""
    puts "    "+"X-X-X-X-X----------"
    puts "    "+"o-o-o-o-o----------"
    puts "    "+"o-o-o-o-o----------"
    puts "    "+"o-o-o-o-o----------"
    puts "    "+"o-o-o-o-o----------"
    puts "    "+"o-o-o-o-o----------"
    puts "    "+"o-o-o-o-o----------"
    puts "    "+"o-o-o-o-o----------"
    puts "    "+"o-o-o-o-o----------"
    puts "    "+"o-o-o-o-o----------"
    puts "    "+"#{@@mychoice[0]}-#{@@mychoice[1]}-#{@@mychoice[2]}-#{@@mychoice[3]}-#{@@mychoice[4]}----------"
    puts ""
  end


  def self.initgameboard
    @@mychoice=['o','o','o','o','o']
    @@check=[]
    if @@mychoice[0]==@@mastermind[0]
      @@check.push(2)
    elsif @@mychoice.count(1..5.each { |x| @@mastermind[x] })
      count+=1
    elsif
    line=[]
    for i in 0...10
      line[i].push(@@mychoice)
    end
    puts ""
    puts "    "+"X-X-X-X-X----------"
    puts "    "+"o-o-o-o-o----------"
    puts "    "+"o-o-o-o-o----------"
    puts "    "+"o-o-o-o-o----------"
    puts "    "+"o-o-o-o-o----------"
    puts "    "+"o-o-o-o-o----------"
    puts "    "+"o-o-o-o-o----------"
    line4= "    "+"o-o-o-o-o----------"
    line3= "    "+"o-o-o-o-o----------"
    line2= "    "+"o-o-o-o-o----------"
    line1= "    "+"#{@@mychoice[0]}-#{@@mychoice[1]}-#{@@mychoice[2]}-#{@@mychoice[3]}-#{@@mychoice[4]}----------"
    puts ""
  end
    line[i]="    "+"#{@@mychoice[0]}-#{@@mychoice[1]}-#{@@mychoice[2]}-#{@@mychoice[3]}-#{@@mychoice[4]}----------"

    if @@mychoice.count(@@mastermind)

  def self.randomize
    # blue red white violet orange green yellow
    clrarray=['b','r','w','v','o','g','y']
    @@mastermind=[]
    (1..5).each do
      @@mastermind.push(clrarray[rand(0..6)])
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
    @@mychoice=gets.split
    if game_over
      #do something
    end
  end

  welcome
  gameboard
  randomize
  choice
end

