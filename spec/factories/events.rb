FactoryBot.define do
  factory :event do
    sport
    sequence(:name) { |n| "Event#{n}" }
  end
end
