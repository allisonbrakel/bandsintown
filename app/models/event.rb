class Event < ApplicationRecord
  belongs_to :band
  belongs_to :venue

  validates :event_date, presence: true
  validates :event_date, length: { minimum: 10 }
end
