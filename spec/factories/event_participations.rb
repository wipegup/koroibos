FactoryBot.define do
  factory :event_participation do
    athlete { nil }
    game { nil }
    event { nil }
    medal { 0 }
  end
end
