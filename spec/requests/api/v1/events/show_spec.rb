require 'rails_helper'

describe 'GET /api/v1/events/:id' do
  describe '/medalists' do
    before :each do
      @sports = create_list(:sport, 3)
      @sports.each_with_index do |sport, index|
        @event = create(:event, sport: sport)
        (0..3).each do |medal|
          create(:event_participation, event: @event, medal: medal)
        end
      end
    end
    it 'returns list of medalists for an event' do
      get "/api/v1/events/#{@event.id}/medalists"
      expect(response.status).to eq(200)

      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:event]).to eq(@event.name)

      medalists = body[:medalists]
      expect(medalists.length).to eq(3)
      medalists.each do |medalist|
        expect(medalist[:name]).not_to be(nil)
        expect(medalist[:team]).not_to be(nil)
        expect(medalist[:age]).not_to be(nil)
        expect(medalist[:medal]).not_to be(nil)
        expect(medalist[:medal]).not_to eq("NA")
      end
    end

    it 'returns an error if invalid event_id' do
      get "/api/v1/events/-1/medalists"
      expect(response.status).to eq(404)

      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:message]).to eq("Invalid Parameters")
    end
  end
end
