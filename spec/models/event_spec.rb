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
end
