require 'rails_helper'

describe 'GET api/v1/olympians', type: :request do

  before :each do
    @athletes = create_list(:athlete, 5)
    @athletes.each do |athlete|
      create(:event_participation, athlete: athlete)
    end
  end

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
        expect(olympian[:sports]).not_to be(nil)
        expect(olympian[:total_medals_won]).not_to be(nil)
      end
    end
  end

  describe 'with age query parameters' do
    it 'can return oldest athlete' do
      get '/api/v1/olympians?age=oldest'
      olympians = JSON.parse(response.body, symbolize_names: true)[:olympians]
      expect(olympians.length).to eq(1)
      olympian = olympians[0]
      expect(olympian[:age]).to eq(@athletes[-1].age)

    end

    it 'can return youngest athlete' do
      get '/api/v1/olympians?age=youngest'
      olympians = JSON.parse(response.body, symbolize_names: true)[:olympians]
      expect(olympians.length).to eq(1)
      olympian = olympians[0]
      expect(olympian[:age]).to eq(@athletes[0].age)
    end
  end

end
