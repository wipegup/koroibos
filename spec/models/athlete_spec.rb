require 'rails_helper'

RSpec.describe Athlete, type: :model do
  describe 'Relationships' do
    it { should belong_to :sport}
  end
end
