json.extract! venue, :id, :name, :longitude, :latitude, :location, :created_at, :updated_at
json.url venue_url(venue, format: :json)
