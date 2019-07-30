class MedalistSerializer
  attr_reader :status
  def initialize(event_id)
    @status = 200
    @event_id = event_id
  end

  def json
    begin
      {
        event: event.name,
        medalists:
          event.medalists.map do |athlete|
            {
              name: athlete.name,
              team: athlete.team,
              age: athlete.age,
              medal: athlete.medal
            }
          end
      }

    rescue ArgumentError => error
      @status = 404
      {message: error.message}
    end
  end

  def event
    event = Event.find_by(id: @event_id)
    raise ArgumentError, "Invalid Parameter" unless event
    event
  end
end
