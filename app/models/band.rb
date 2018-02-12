class Band < ApplicationRecord
  validates :name, :event_count, presence:  true
end
