class Athlete < ApplicationRecord
  has_many :event_participations
  has_many :events, through: :event_participations
  has_many :games, through: :event_participations

  enum sex: ["F","M"]

  def self.full_athlete_info
    joins(events: :sport)
      .group("athletes.id").group("sports.name")
      .select("athletes.name, athletes.age, athletes.team, sports.name as sport_name, COUNT(case when event_participations.medal != 0 then 1 else null end) as medal_count")
      .order("medal_count")
  end

  def total_medals
    event_participations.where.not(medal: "NA").count
  end

  def sports
    events.joins(:sport).distinct.pluck("sports.name")
  end

  def self.age_order(direction, limit)
    order(age: direction).limit(limit)
  end

  def self.avg_weight(sex = nil)
    athletes = athletes_by_sex(sex)
    athletes.average(:weight)
  end

  def self.avg_age(sex = nil)
    athletes = athletes_by_sex(sex)
    athletes.average(:age)
  end

  def self.athletes_by_sex(sex)
    if sex
      return Athlete.where(sex:sex)
    else
      return Athlete.all
    end
  end

end
