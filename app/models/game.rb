class Game < ApplicationRecord
  has_many :event_participations
  has_many :athletes, through: :event_participations
  has_many :sports, through: :event_participations
  has_many :events, through: :event_participations

  def competing_athletes
    athletes.distinct.count
  end
end
