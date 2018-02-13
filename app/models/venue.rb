class Venue < ApplicationRecord
  has_many :events

  validates :name, :longitude, :latitude, :location, presence: true
  validates :name, uniqueness: true
  validates :name, :location, length: { minimum: 2 }
  validates :longitude, :latitude, numericality: true
end
