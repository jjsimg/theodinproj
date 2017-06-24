#write your code here
def translate(phrase)
	vow="aeiou".split("")
	newphrase=""
	phrase.split.each {|word| (vow.include? word[0]) ? newphrase+=word+"ay" : newphrase+=word[1..word.length]+word[0]+"ay"}
	phrase.split.each {|word| word.each {|letter|}}
	newphrase
end