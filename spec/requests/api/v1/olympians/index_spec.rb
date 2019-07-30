require 'rails_helper'

describe 'GET api/v1/olympians', type: :request do
  describe 'without query parameters' do
    it 'returns status 200' do
      get '/api/v1/olympians'
      expect(response).to be_successful
    end

    it 'returns a list of olympians' do
      get '/api/v1/olympians'
      body = JSON.parse(response.body, symbolize_names: true)
      expect(body[:olympians].class).to be(Array)
    end

    it 'each olympian has the correct attributes' do
      get '/api/v1/olympians'
      olympians = JSON.parse(response.body, symbolize_names: true)[:olympians]

      olympians.each do |olympian|
        expect(olympian[:name]).not_to be(nil)
        expect(olympian[:age]).not_to be(nil)
        expect(olympian[:team]).not_to be(nil)
        expect(olympian[:sport]).not_to be(nil)
        expect(olympian[:total_medals_won]).not_to be(nil)
      end
    end
  end

end
