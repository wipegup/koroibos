class AthleteSerializer
  attr_reader :status
  def initialize(filters)
    @filters = filters
    @status = 200
  end

  def json
    begin
      {
        olympians:
          athletes.map do |athlete|
            {
              name: athlete.name,
              age: athlete.age,
              team: athlete.team,
              sports: athlete.sport_name,
              total_medals_won: athlete.medal_count,
            }
          end

      }

    rescue ArgumentError => error
      @status = 404
      {message: error.message}
    end

  end

  private

  def athletes
    current_selection = Athlete.full_athlete_info
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
    else
      raise ArgumentError, "Invalid Parameter"
    end
    athletes
  end

end
