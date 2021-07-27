#requiring gem packages

require 'open-uri'
require 'nokogiri'
require 'csv'

#creating a variable for the url
url = "http://en.wikipedia.org/wiki/List_of_current_NBA_team_rosters"


#creating a variable which will scrape the page
page = Nokogiri::HTML(URI.open(url))

#put string is calling the page variable and scraping for the outline li.toclevel-3 html, 
# not sure what the .css part is about, and then .text is a ruby method that looks at the line of code
# and pulls out the text from that
# puts page.css('li.toclevel-3 span.toctext').text


#each is a special ruby method along with do and line creates a loop
#and the puts inside of it is what is in the loop
#end finishes the loop
# page.css('li.toclevel-3 span.toctext').each do |line|
#   puts line.text
# end

#creating variable name array
name = []

# << symbol means to take line.text and add it to the name variable, so while it is in a loop
# this will add the line.text to the array
page.css('li.toclevel-3 span.toctext').each do |line|
  name << line.text
end

#Write data to csv file
#open a file called nab_teams...csv file in current folder or create it
# store it in a variable called file, "w" is writing to the file
CSV.open("nba_teams_listing.csv", "w") do |file|
  # creating column title
  file << ["Team Name"]
  # this is creating a times loop rather than an each
  #times is when we have a specific number in times to run the loop
  name.length.times do |i|
    # adding new row of data for the nba team name into the csv file
    file << [name[i]]
  end
end