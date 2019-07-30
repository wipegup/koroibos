require 'rails_helper'

describe 'Returns Welcome JSON', type: :request do
  describe 'GET /' do
    it 'returns status 200' do

      get '/'
      expect(response).to be_successful
    end
  end
end
