require 'rails_helper'

RSpec.describe Athlete, type: :model do
  describe 'Relationships' do
    it { should have_many :event_participations}
    it { should have_many(:events).through(:event_participations) }
    it { should have_many(:games).through(:event_participations) }
  end
end
