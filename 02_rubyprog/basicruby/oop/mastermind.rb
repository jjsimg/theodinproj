class Mastermind

  @@counter=['x','x','x','x','x','x','x','x','x','x']

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


  # def self.initgameboard
  #   @@mychoice=['o','o','o','o','o']
  #   @@check=[]
  #   if @@mychoice[0]==@@mastermind[0]
  #     @@check.push(2)
  #   elsif @@mychoice.count(1..5.each { |x| @@mastermind[x] })
  #     count+=1
  #   elsif
  #   end
  # end

  
    # puts ""
    # puts "    "+"X-X-X-X-X----------"
    # puts "    "+"o-o-o-o-o----------"
    # puts "    "+"o-o-o-o-o----------"
    # puts "    "+"o-o-o-o-o----------"
    # puts "    "+"o-o-o-o-o----------"
    # puts "    "+"o-o-o-o-o----------"
    # puts "    "+"o-o-o-o-o----------"
    # line4= "    "+"o-o-o-o-o----------"
    # line3= "    "+"o-o-o-o-o----------"
    # line2= "    "+"o-o-o-o-o----------"
    # line1= "    "+"#{@@mychoice[0]}-#{@@mychoice[1]}-#{@@mychoice[2]}-#{@@mychoice[3]}-#{@@mychoice[4]}----------"
    # puts ""
    # line[i]="    "+"#{@@mychoice[0]}-#{@@mychoice[1]}-#{@@mychoice[2]}-#{@@mychoice[3]}-#{@@mychoice[4]}----------"

  def self.makeboard
    (1..11).each_with_index do |x,idx|
      if idx==0
        puts "    "+"X-X-X-X-X----------"
      elsif @@counter[idx-1]=='x'
        puts "    "+"o-o-o-o-o----------" # if player hasn't made a choice at this line yet
      else
        puts "    "+"#{@@mychoice[0]}-#{@@mychoice[1]}-#{@@mychoice[2]}-#{@@mychoice[3]}-#{@@mychoice[4]}----------" # if currently on this line
        @@counter[-idx]='x'
        @@counter[-idx+1]='o'
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
    if not @@counter.include?('o')
      @@counter=['x','x','x','x','x','x','x','x','x','o']
    end
    if game_over
      #do something
    end
    @@mychoice
  end

  welcome
  makeboard
  randomize
  choice
end

