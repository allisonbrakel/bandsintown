class Event < ApplicationRecord
  belongs_to :band
  belongs_to :venue
end
