# require 'mechanize'
#
# mechanize = Mechanize.new
#
# page = mechanize.get('https://seatgeek.com/tba/festivals/vans-warped-tour/')
#
# bands = page.at('/html/body/div[1]/div/div/article/div[1]/div[3]/p[7]').text.strip
#
# split_bands = bands.split("\n");
#
# split_bands.each_index do |i|
#   index = split_bands[i].index('(');
#   split_bands[i] = split_bands[i][0..index-2]
# end
#
# # puts split_bands
#
#
# require 'net/http'
# require 'json'
# require 'pp'
#
# split_bands.each do |band|
#   urlBand = band.sub(' ', '%20')
#   urlBand = urlBand.sub(' ', '%20')
#   url = 'https://rest.bandsintown.com/artists/' + urlBand + '?app_id=allison'
#   #puts url
#   uri = URI(url)
#   response = Net::HTTP.get(uri)
#
#   data = JSON.parse(response);
#
#   event_count = data['upcoming_event_count']
#
#   puts "Band: #{band} Event Count: #{event_count}"
# end

puts Band.first