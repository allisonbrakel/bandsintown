class Band < ApplicationRecord
  has_many :events
  validates :name, :event_count, presence: true
  validates :name, length: { minimum: 2 }
  validates :event_count, numericality: true
end
