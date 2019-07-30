require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'Validations' do

  end

  describe 'Relationships' do
    it { should belong_to :sport }
    it { should have_many :event_participations }
    it { should have_many(:athletes).through(:event_participations) }
    it { should have_many(:games).through(:event_participations) }
  end

  describe 'Instance Methods' do
    describe 'medalists' do
      it 'Returns all medalists from an event' do
        participating_athletes = create_list(:athlete,4)
        other_athlete = create(:athlete)
        event = create(:event)
        participating_athletes.each_with_index do |athlete, medal|
          create(:event_participation, athlete:athlete, medal:medal)
        end

        nothing, gold, silver, bronze = participating_athletes
        medalists = event.medalists

        expect(medalists.length).to eq(3)

        medalists.each do |medalist|
          expect(medalist.id).not_to eq(nothing.id)
          expect(medalist.id).not_to eq(other_athlete.id)

        end
      end
    end
  end
end
