require 'rails_helper'

describe 'GET api/v1/olympians', type: :request do
  describe 'without query parameters' do
    it 'returns status 200' do
      get '/api/v1/olympians'
      expect(response).to be_successful
    end

    it 'returns a list of olympians' do
      get '/api/v1/olympians'
      # binding.pry
      expect(response.body)
    end
  end

end
