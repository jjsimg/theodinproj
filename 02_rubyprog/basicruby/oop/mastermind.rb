class Mastermind
  @@counter=['x','x','x','x','x','x','x','x','x','x']
  @@mychoice=""
  @@pastchoice=[]

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

  def self.makeboard
    puts ""
    puts "    "+"X-X-X-X-X----------"
    @@counter.each_with_index do |x,idx1|
      if @@counter[idx1]=='x'
        puts "    "+"*-*-*-*-*----------" # if player hasn't made a choice at this line yet
      elsif @@counter[idx1]=='*'
        mc0=@@mychoice[0]
        mc1=@@mychoice[1]
        mc2=@@mychoice[2]
        mc3=@@mychoice[3]
        mc4=@@mychoice[4]
        f="    "+"#{mc0}-#{mc1}-#{mc2}-#{mc3}-#{mc4}----------"
        @@pastchoice.unshift(f)
        @@counter[idx1-1]='*'
        @@counter.pop
        @@pastchoice.each do |item|
          puts item
        end
      end
    end
  end

  def self.randomize
    # blue red white violet orange green yellow
    colours=['b','r','w','v','o','g','y']
    @@mastermind=[]
    (1..5).each do
      @@mastermind.push(colours[rand(0..6)])
    end
  end

  def self.choice
    puts ""
    puts ""
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
    if not @@counter.include?('*')
      @@counter=['x','x','x','x','x','x','x','x','x','*']
    end
    if game_over
      #do something
    end
    @@mychoice
  end

  welcome
  randomize
  makeboard
  choice
  makeboard
  choice
  makeboard
  choice
  makeboard
  choice
  makeboard
  choice
end

