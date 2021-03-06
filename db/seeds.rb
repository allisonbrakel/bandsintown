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

Event.destroy_all
Band.destroy_all
Venue.destroy_all


mechanize = Mechanize.new

page = mechanize.get('https://seatgeek.com/tba/festivals/vans-warped-tour/')

bands = page.at('/html/body/div[1]/div/div/article/div[1]/div[3]/p[7]').text.strip

split_bands = bands.split("\n").map(&:strip);

split_bands.each_index do |i|
  index = split_bands[i].index('(');
  split_bands[i] = split_bands[i][0..index-2]
end


split_bands.each do |band|
  urlBand = band.sub(' ', '%20')
  urlBand = urlBand.sub(' ', '%20')
  url = 'https://rest.bandsintown.com/artists/' + urlBand + '?app_id=allison'
  uri = URI(url)
  response = Net::HTTP.get(uri)

  data = JSON.parse(response);

  event_count = data['upcoming_event_count']

  newBand = Band.create(name: band,
              event_count: event_count)

  # Do venue information here
  url = 'https://rest.bandsintown.com/artists/' + urlBand + '/events?app_id=allison'
  uri = URI(url)
  response = Net::HTTP.get(uri)

  data = JSON.parse(response);
  #puts data

  data.each do |key|
    name =  key["venue"]['name']
    long =  key["venue"]['longitude']
    lat = key["venue"]['latitude']
    location = key["venue"]['city'] + ", " + key["venue"]['country']
    newVenue = Venue.find_or_create_by(name: name, longitude: long, latitude: lat, location: location)
    date = key['datetime']
    onsale = key['on_sale_datetime']

    Event.create(event_date: date, onsale_date: onsale, band: newBand, venue: newVenue)
  end

end

puts "Seed generated: #{Band.count} bands"
puts "Seed generated #{Venue.count} venues"
puts "Seed generated #{Event.count} events"

