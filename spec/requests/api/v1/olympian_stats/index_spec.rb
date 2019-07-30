require 'rails_helper'

describe 'GET /api/v1/olympian_stats' do
  before :each do
    game = create(:game)
    (1..4).each do |num|
      athlete = create(:athlete,
        name:"Athlete#{num}", sex: (num % 2),
        height: num, weight: num, age: num
      )

      create(:event_participation, athlete: athlete, game: game)
    end
  end
  it 'returns collection of statistics' do
    get '/api/v1/olympian_stats'

    expect(response.status).to eq(200)
    stats = JSON.parse(response.body, symbolize_names: true)[:olympian_stats]
    expect(stats).to_not be(nil)

    expect(stats[:total_competing_olympians]).to eq(4)
    expect(stats[:average_age].to_f).to eq(2.5)

    weight = stats[:average_weight]
    expect(weight[:unit]).to eq("kg")
    expect(weight[:male_olympians].to_f).to eq(2)
    expect(weight[:female_olympians].to_f).to eq(3)

  end
end
