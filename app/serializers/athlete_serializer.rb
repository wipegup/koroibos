class AthleteSerializer
  def initialize(filters)
    @filters = filters
  end

  def json
    {
      olympians:
        athletes.map do |athlete|
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

  private

  def athletes
    current_selection = Athlete.all
    if @filters.keys.length != 0
      if @filters[:age]
        current_selection = filter_age(current_selection, @filters[:age])
      end
    end

    current_selection
  end

  def filter_age(athletes, age_filter)
    if age_filter == "youngest"
      athletes = athletes.age_order(:asc, 1)
    elsif age_filter == "oldest"
      athletes = athletes.age_order(:desc, 1)
    end
    athletes
  end

end
