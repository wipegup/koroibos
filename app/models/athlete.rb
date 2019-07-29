class Athlete < ApplicationRecord
  has_many :event_participations
  has_many :events, through: :event_participations
  has_many :games, through: :event_participations

end
