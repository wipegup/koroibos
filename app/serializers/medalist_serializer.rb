class MedalistSerializer
  attr_reader :status
  def initialize(event)
    @status = 200
    @event = event
  end

  def json

      {
        event: @event.name,
        medalists:
          @event.medalists.map do |athlete|
            {
              name: athlete.name,
              team: athlete.team,
              age: athlete.age,
              medal: athlete.medal
            }
          end
      }
  end
end
