class Event < ApplicationRecord
  belongs_to :sport
  has_many :event_participations
  has_many :athletes, through: :event_participations
  has_many :games, through: :event_participations

end
