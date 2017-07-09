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

# Moving Displaying Legislators to a Method
require "csv"
require 'sunlight/congress'

Sunlight::Congress.api_key = "e179a6973728c4dd3fb1204283aaccb5"

def clean_zipcode(zipcode)
  zipcode.to_s.rjust(5,"0")[0..4]
end

def legislators_by_zipcode(zipcode)
  legislators = Sunlight::Congress::Legislator.by_zipcode(zipcode)
  legislator_names = legislators.collect do |legislator|
    "#{legislator.first_name} #{legislator.last_name}"
  end
  legislator_names.join(", ")
end

contents=CSV.open "event_attendees.csv", headers: true, header_converters: :symbol
contents.each do |row|
  name = row[:first_name] # We can access column names with symbols
  zipcode = clean_zipcode(row[:zipcode])
  legislators = legislators_by_zipcode(zipcode)

  puts "#{name} #{zipcode} #{legislators}"
end