class EventSerializer
  def json
    {
      events:
      Sport.all.map do |sport|
        {
          sport: sport.name,
          events: sport.events.distinct.pluck("events.name")
        }
      end
    }
  end
end
