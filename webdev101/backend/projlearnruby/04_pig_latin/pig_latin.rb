#write your code here
def translate(phrase)
	vow="aeiou".split("")
	newphrase=""
	phrase.split.each do |word|
		cons=""
		word.split("").each_with_index do |letter,index| 
			if letter=="u" and index>0 or not vow.include? letter
				cons+=letter
			elsif vow.include? letter
				newphrase+=word[index..word.length]+cons+"ay"+" "
				break
			end
		end
	end
	newphrase.chomp(" ")
end
# puts translate("Bobby Hitchens is from Denmark")