FactoryBot.define do
  factory :event_participation do
    athlete
    game
    event
    medal { 0 }
  end
end
