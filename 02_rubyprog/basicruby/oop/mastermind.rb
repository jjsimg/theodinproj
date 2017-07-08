class Mastermind
  @@counter=['x','x','x','x','x','x','x','x','x','x']
  @@mychoice=""
  @@pastchoice=[]

  def self.game_over
    # game_over when size of @@pastchoice==10
    if @@pastchoice.size==10
      puts "the game is over, you lose"
      true
    else 
      false
    end
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

        c0=@@clue[0]
        c1=@@clue[1]
        c2=@@clue[2]
        c3=@@clue[3]
        c4=@@clue[4]
        f="    "+"#{mc0}-#{mc1}-#{mc2}-#{mc3}-#{mc4}-#{c0}-#{c1}-#{c2}-#{c3}-#{c4}"
        @@pastchoice.unshift(f)
        @@counter[idx1-1]='*'
        @@counter.pop
        @@pastchoice.each do |item|
          puts item
        end
      puts @@mastermind
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
    @@mychoice
  end

  def self.checkchoice
    @@clue=[0,0,0,0,0]
    counter=rand(5)
    t=@@mastermind.clone
    @@mychoice.each_with_index do |colour_pick,idx|
      if colour_pick==t[idx]
        @@clue[counter]=2
        t.delete(colour_pick)
        counter+=1
        counter=0 if counter>4
      elsif t.include? colour_pick
        @@clue[counter]=1
        t.delete(colour_pick)
        counter+=1
        counter=0 if counter>4
      else
        next
      end
    end
  end

  welcome
  randomize
  until game_over
    choice
    checkchoice
    makeboard
  end
end

