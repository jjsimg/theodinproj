#write your code here
def translate(phrase)
  vow="aeiou".split("")
  newphrase=""
  phrase.split.each do |word|
    cons=""
    word.split("").each_with_index do |letter,index|
      if index==0
        letter==letter.upcase ? capword=true : capword=false
      end
      if letter=="u" and index>0 or not vow.include? letter
        cons+=letter
      else
        if capword #this condition is never evaluated as true
          newphrase+=word[index..word.length].capitalize+cons.downcase+"ay"+" "
          break
        else
          newphrase+=word[index..word.length]+cons+"ay"+" "
          break
        end
      end
    end
  end
  newphrase.chomp(" ")
end
puts translate("Bobby Hitchens is from Denmark")