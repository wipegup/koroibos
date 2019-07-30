class AthleteSerializer
  def initialize

  end

  def json
    {
      olympians:
        Athlete.all.map do |athlete|
          {
            name: athlete.name,
            age: athlete.age,
            team: athlete.team,
            sports: athlete.sports,
            total_medals_won: athlete.total_medals,
          }
        end,
        
  }
  end
end
