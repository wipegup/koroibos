FactoryBot.define do
  factory :athlete do
    name { "MyString" }
    sex { 1 }
    height { 1 }
    weight { 1 }
    team { "MyString" }
    sport { nil }
  end
end
