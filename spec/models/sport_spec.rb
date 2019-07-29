require 'rails_helper'

RSpec.describe Sport, type: :model do
  describe 'Validations' do

  end

  describe 'Relationships' do
    it {should have_many :events}
  end
end
