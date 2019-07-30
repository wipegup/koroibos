require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'Validations' do

  end

  describe 'Relationships' do
    it { should have_many :event_participations }
    it { should have_many(:athletes).through(:event_participations) }
    it { should have_many(:events).through(:event_participations) }
  end

  describe 'Instance Methods' do
    describe 'competing_athletes' do
      it 'returns integer number of athletes at that game' do
        game, other_game = create_list(:game, 2)
        participating_athletes = create_list(:athlete, 5)
        other_athletes = create_list(:athlete,7)

        participating_athletes.each do |athlete|
          create_list(:event_participation, 2, game: game, athlete: athlete)
        end

        other_athletes.each do |athlete|
          create(:event_participation, game: other_game, athlete: athlete)
        end

        expect(game.competing_athletes).to eq(5)
        expect(other_game.competing_athletes).to eq(7)
      end
    end
  end
end
