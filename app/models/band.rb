class Band < ApplicationRecord
  has_many :events

  validates :name, :event_count, presence:  true
end
