# Reads the File Contents
# contents=File.read("./event_attendees.csv")
# puts contents

# Read the File Line by Line
# lines = File.readlines "event_attendees.csv"
# lines.each_with_index do |line,index|
# 	next if index==0
# 	columns = line.split(",")
# 	name = columns[2]
# 	puts name
# end

# Switching over to CSV library
# require "csv"

# contents=CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
# contents.each do |row|
# 	name = row[:first_name] # We can access column names with symbols
# 	zipcode = row[:zipcode]
# 	puts "#{name} #{zipcode}"
# end

# Handling Bad and Good Zip Codes
# require "csv"

# contents=CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
# contents.each do |row|
# 	name = row[:first_name] # We can access column names with symbols
# 	zipcode = row[:zipcode]

# 	if zipcode.nil?
# 		zipcode = "00000"
# 	elsif zipcode.length < 5
# 		zipcode = zipcode.rjust 5, "0"
# 	elsif zipcode.length > 5
# 		zipcode = zipcode[0..4]
# 	end

# 	puts "#{name} #{zipcode}"
# end

# Moving Clean Zip Codes to a Method
# require "csv"

# def clean_zipcode(zipcode)
# 	# if zipcode.nil?
# 	# 	"00000"
# 	# elsif zipcode.length < 5
# 	# 	zipcode.rjust 5, "0"
# 	# elsif zipcode.length > 5
# 	# 	zipcode[0..4]
# 	# else
# 	# 	zipcode
# 	# end
#   # More succintly we can just do 
#   zipcode.to_s.rjust(5,"0")[0..4]
# end

# contents=CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
# contents.each do |row|
# 	name = row[:first_name] # We can access column names with symbols

#   zipcode = clean_zipcode(row[:zipcode])

# 	puts "#{name} #{zipcode}"
# end

# Showing All legislators in a zip code using sunlight
# require "csv"
# require 'sunlight/congress'

# Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

# def clean_zipcode(zipcode)
#   zipcode.to_s.rjust(5,"0")[0..4]
# end

# contents=CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
# contents.each do |row|
#   name = row[:first_name] # We can access column names with symbols
#   zipcode = clean_zipcode(row[:zipcode])

#   legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)
#   legislator_names = legislators.collect do |legislator|
#     "#{legislator.first_name} #{legislator.last_name}"
#   end

#   legislator_string = legislator_names.join(", ")

#   puts "#{name} #{zipcode} #{legislator_string}"
# end

# Moving Displaying Legislators to a Method and using a Form Letter
# require "csv"
# require 'sunlight/congress'

# Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

# def clean_zipcode(zipcode)
#   zipcode.to_s.rjust(5,"0")[0..4]
# end

# def legislators_by_zipcode(zipcode)
#   legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)
#   legislator_names = legislators.collect do |legislator|
#     "#{legislator.first_name} #{legislator.last_name}"
#   end
#   legislator_names.join(", ")
# end

# template_letter = File.read "form_letter.html"

# contents=CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
# contents.each do |row|
#   name = row[:first_name] # We can access column names with symbols
#   zipcode = clean_zipcode(row[:zipcode])
#   legislators = legislators_by_zipcode(zipcode)

#   personal_letter = template_letter.gsub('FIRST_NAME',name)
#   personal_letter = personal_letter.gsub('LEGISLATORS',legislators)

#   puts personal_letter
# end

# ERB
# require 'erb'

# meaning_of_life = 42

# question = "The Answer to the Ultimate Questions of Life, the Universe, and Everything is <%= meaning_of_life %>"
# template = ERB.new question

# results = template.result(binding)
# puts results

# Moving Displaying Legislators to a Method and using a Form Letter
# require "csv"
# require 'sunlight/congress'
# require 'erb'

# Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

# def clean_zipcode(zipcode)
#   zipcode.to_s.rjust(5,"0")[0..4]
# end

# def legislators_by_zipcode(zipcode)
#   legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)
# end

# template_letter = File.read "form_letter.erb"
# erb_template = ERB.new template_letter

# contents=CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
# contents.each do |row|
#   name = row[:first_name] # We can access column names with symbols
#   zipcode = clean_zipcode(row[:zipcode])
#   legislators = legislators_by_zipcode(zipcode)

#   form_letter = erb_template.result(binding)
#   puts form_letter
# end

# Outputting form letters to a file and put it in a method called save_thank_you_letter
require "csv"
require 'sunlight/congress'
require 'erb'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

def legislators_by_zipcode(zipcode)
  legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)
end

def save_thank_you_letters(id,form_letter)
  Dir.mkdir("output") unless Dir.exists? "output"
  filename = "output/thanks_#{id}.html"
  File.open(filename,'w') do |file|
    file.puts form_letter
  end
end

def clean_phone_number(phone_number)
  # fixed_phone_number=phone_number.gsub("/[.)(-]/","").split("")
  # fixed_phone_number.delete(" ")
  phone_number=phone_number.split("")
  phone_number.delete(" ")
  phone_number.delete(".")
  phone_number.delete("(")
  phone_number.delete(")")
  phone_number.delete("-")
  if phone_number[0]=='1' and phone_number.size==11
    phone_number[1..10].join("")
  elsif phone_number.size==10
    phone_number.join("")
  elsif phone_number[0]!='1' or phone_number.size<10
    'bad number'
  end
end

def get_date_and_time(date_and_time)
  d_and_t = DateTime.strptime(date_and_time, "%m/%d/%Y %H:%M")
end

def find_hour(register_date)
  d_and_t = get_date_and_time(register_date)
  hour=d_and_t.strftime("%H")
end

def find_day(register_date)
  d_and_t = get_date_and_time(register_date)
  day=d_and_t.strftime("%w")
  case day
  when "0"
    :Sunday
  when "1"
    :Monday
  when "2"
    :Tuesday
  when "3"
    :Wednesday
  when "4"
    :Thursday
  when "5"
    :Friday
  when "6"
    :Saturday
  end
end

hour_hash=Hash.new(0)
day_hash=Hash.new(0)

template_letter = File.read "form_letter.erb"
erb_template = ERB.new template_letter

contents=CSV.open "full_event_attendees.csv", headers: true, header_converters: :symbol
contents.each do |row|
  id = row[0]
  name = row[:first_name] # We can access column names with symbols
  # zipcode = clean_zipcode(row[:zipcode])
  # legislators = legislators_by_zipcode(zipcode)
  # form_letter = erb_template.result(binding)

  # phone_number = clean_phone_number(row[:homephone])
  hour = find_hour(row[:regdate])
  day = find_day(row[:regdate])
  hour_hash[hour]+=1
  day_hash[day]+=1

  # save_thank_you_letters(id,form_letter)

  # puts "#{name} #{hour}"
end
puts hour_hash.sort_by {|key,value| value}.reverse.to_h
puts day_hash.sort_by {|key,value| value}.reverse.to_h

