class StatsSerializer
  def json
    {
      olympian_stats: {
        total_competing_olympians: Game.first.competing_athletes,
        average_weight: {
          unit: "kg",
          male_olympians: Athlete.avg_weight(:M),
          female_olympians: Athlete.avg_weight(:F)
        },
        average_age: Athlete.avg_age
      }
    }
  end
end
