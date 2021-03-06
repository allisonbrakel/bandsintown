# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'net/http'
require 'json'
require 'pp'
require 'mechanize'


mechanize = Mechanize.new

page = mechanize.get('https://seatgeek.com/tba/festivals/vans-warped-tour/')

bands = page.at('/html/body/div[1]/div/div/article/div[1]/div[3]/p[7]').text.strip

split_bands = bands.split("\n").map(&:strip);

split_bands.each_index do |i|
  index = split_bands[i].index('(');
  split_bands[i] = split_bands[i][0..index-2]
  puts split_bands[i]
end

#
# split_bands.each do |band|
#   urlBand = band.sub(' ', '%20')
#   urlBand = urlBand.sub(' ', '%20')
#   url = 'https://rest.bandsintown.com/artists/' + urlBand + '?app_id=allison'
#   uri = URI(url)
#   response = Net::HTTP.get(uri)
#
#   data = JSON.parse(response);
#
#   event_count = data['upcoming_event_count']
#
#   # Band.create(name: band,
#   #             event_count: event_count)
#
#   url = 'https://rest.bandsintown.com/artists/' + urlBand + '/events?app_id=allison'
#   uri = URI(url)
#   response = Net::HTTP.get(uri)
#
#   data = JSON.parse(response);
#   #puts data
#
#   data.each do |key|
#     name =  key["venue"]['name']
#     long =  key["venue"]['longitude']
#     lat = key["venue"]['latitude']
#     location = key["venue"]['city'] + ", " + key["venue"]['country']
#     puts location
#     puts key['datetime']
#     puts key['on_sale_datetime']
#   end
#
# end
#
#
#
