FactoryBot.define do
  factory :sport do
    sequence(:name) { |n| "Sport#{n+1}"}
  end
end
