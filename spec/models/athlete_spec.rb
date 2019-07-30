require 'rails_helper'

RSpec.describe Athlete, type: :model do
  describe 'Relationships' do
    it { should have_many :event_participations}
    it { should have_many(:events).through(:event_participations) }
    it { should have_many(:games).through(:event_participations) }
  end

  describe 'Instance Methods' do
    before :each do
      sport, other_sport = create_list(:sport, 2)
      game = create(:game)
      event = create(:event, sport_id: sport.id)
      @athlete = create(:athlete)

      (0..3).each do |num|
        create(:event_participation,
          athlete: @athlete, game: game, event: event, medal: num
        )
      end

    end

    describe 'total_medals' do
      it 'returns total number of medals won by athlete' do
        expect(@athlete.total_medals).to eq(3)
      end
    end

    describe 'sports' do
      it 'returns list of strings of names of all sports' do
        expect(@athlete.sports.length).to eq(1)
        expect(@athlete.sports[0]).to eq("Sport1")
      end
    end
  end

  describe 'Class Methods' do
    before :each do
      (1..4).each do |num|
        create(:athlete,
          name:"Athlete#{num}", sex: (num % 2),
          height: num, weight: num, age: num
        )
      end
    end

    describe 'age_order' do
      it 'orders athletes by age and returns the specified number of athletes' do
        oldest = Athlete.age_order(:desc, 1)
        expect(oldest.length).to eq(1)
        expect(oldest[0].name).to eq("Athlete4")
        expect(oldest[0].age).to eq(4)
        expect(oldest[0].height).to eq(4)

        youngest = Athlete.age_order(:asc, 2)
        expect(youngest.length).to eq(2)
        expect(youngest[0].name).to eq("Athlete1")
        expect(youngest[0].age).to eq(1)
        expect(youngest[0].height).to eq(1)

        expect(youngest[1].name).to eq("Athlete2")
        expect(youngest[1].age).to eq(2)
        expect(youngest[1].height).to eq(2)

      end
    end

    describe 'avg_weight' do
      it 'With an argument of "F" or "M" returns average weight of those athletes' do
        m_average = Athlete.avg_weight(:M)
        f_average = Athlete.avg_weight(:F)

        expect(m_average).to eq(2)
        expect(f_average).to eq(3)
      end
      it 'Without an argument returns average weight of all athletes' do
        all_average = Athlete.avg_weight

        expect(all_average).to eq(2.5)
      end
    end

    describe 'avg_age' do
      it 'With an argument of "F" or "M" returns average age of those athletes' do
        m_average = Athlete.avg_age(:M)
        f_average = Athlete.avg_age(:F)

        expect(m_average).to eq(2)
        expect(f_average).to eq(3)
      end
      it 'Without an argument returns average age of all athletes' do
        all_average = Athlete.avg_age

        expect(all_average).to eq(2.5)
      end
    end
  end
end
