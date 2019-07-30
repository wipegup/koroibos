require 'rails_helper'

RSpec.describe EventParticipation, type: :model do
  describe 'Validations' do

  end

  describe 'Relationships' do
    it {should belong_to :athlete}
    it {should belong_to :event}
    it {should belong_to :game}
  end
end
