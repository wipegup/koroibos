class Athlete < ApplicationRecord
  has_many :event_participations
  has_many :events, through: :event_participations
  has_many :games, through: :event_participations

  enum sex: ["F","M"]

  def self.age_order(direction, limit)
    order(age: direction).limit(limit)
  end

  def self.avg_weight(sex = nil)
    if sex
       athletes = Athlete.where(sex:sex)
    else
      athletes = Athlete.all
    end

    athletes.average(:weight)
  end
end
