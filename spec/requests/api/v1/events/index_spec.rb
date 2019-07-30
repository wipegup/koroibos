require 'rails_helper'

describe 'GET /api/v1/events/' do
  before :each do
    @sports = create_list(:sport, 3)
    @sports.each_with_index do |sport, index|
      create_list(:event, (5-index), sport: sport)
    end
  end

  it 'returns list of sports and associated events' do
    get '/api/v1/events'
    expect(response.status).to eq(200)
    events = JSON.parse(response.body, symbolize_names: true)[:events]
    # binding.pry
    expect(events.class).to be(Array)

    expect(events.length).to eq(@sports.length)
    events.each do |event|
      sport_index = @sports.find_index{ |sport| sport.name == event[:sport]}
      expect(event[:events].length).to eq(5-sport_index)
    end
  end
end
