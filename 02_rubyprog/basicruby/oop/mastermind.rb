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

  # def self.gameboard
  #   puts ""
  #   puts "    "+"X-X-X-X-X----------"
  #   puts "    "+"o-o-o-o-o----------"
  #   puts "    "+"o-o-o-o-o----------"
  #   puts "    "+"o-o-o-o-o----------"
  #   puts "    "+"o-o-o-o-o----------"
  #   puts "    "+"o-o-o-o-o----------"
  #   puts "    "+"o-o-o-o-o----------"
  #   puts "    "+"o-o-o-o-o----------"
  #   puts "    "+"o-o-o-o-o----------"
  #   puts "    "+"o-o-o-o-o----------"
  #   puts "    "+"#{@@mychoice[0]}-#{@@mychoice[1]}-#{@@mychoice[2]}-#{@@mychoice[3]}-#{@@mychoice[4]}----------"
  #   puts ""
  # end


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



  def self.makeboard
    catch (:done) do
      (1..11).each_with_index do |x,idx|
        if idx==0
          puts ""
          puts "    "+"X-X-X-X-X----------"
        elsif @@counter[idx-1]=='x'
          puts "    "+"*-*-*-*-*----------" # if player hasn't made a choice at this line yet
        elsif @@counter[idx-1]=='*'
          mc0=@@mychoice[0]
          mc1=@@mychoice[1]
          mc2=@@mychoice[2]
          mc3=@@mychoice[3]
          mc4=@@mychoice[4]
          f="    "+"#{mc0}-#{mc1}-#{mc2}-#{mc3}-#{mc4}----------"
          @@pastchoice.push(f)
          puts f
          @@counter[idx-1]='**'
          @@counter[idx-2]='*'
        elsif @@counter[idx-1]=="**"
          # while loop? and keep iterating until array is done printing contents then use break
          @@pastchoice.each_with_index do |i,idx|
            puts @@pastchoice[idx]
            throw :done if idx==@@pastchoice.size-1
          end
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

