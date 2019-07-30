FactoryBot.define do
  factory :athlete do
    name { "MyString" }
    sex { 1 }
    height { 1 }
    weight { 1 }
    team { "MyString" }
    sequence(:age) { |n| n}
  end
end
