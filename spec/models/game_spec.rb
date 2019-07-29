require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'Validations' do

  end

  describe 'Relationships' do
    it { should have_many :event_participations }
    it { should have_many(:athletes).through(:event_participations) }
    it { should have_many(:events).through(:event_participations) }
    it { should have_many(:sports).through(:events) }

  end
end
