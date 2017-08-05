#write your code here
def echo(greeting) greeting; end

def shout(greeting) greeting.upcase; end

def repeat(greeting,rep=2) ((greeting+" ")*rep).chomp(" "); end

def start_of_word(word,index) word.slice(0...index); end

def first_word(words) words.split[0]; end

def titleize(title)
  smallwords=["and","the","over"]
  newtitle=''
  title.split.each_with_index do |word,index|
    if index==0
      newtitle+=word[0].upcase+word[1..word.length]+" "
    else
      (smallwords.include? word) ? newtitle+=word+" " : newtitle+=word[0].upcase+word[1..word.length]+" "
    end
  end
  newtitle.chomp(" ")
end