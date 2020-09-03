FactoryBot.define do
  factory :item do
    name                      { Faker::Name.initials(number: 2) }
    info                      { Faker::Lorem.characters(number: 10) }
    category_id               { Faker::Number.between(from: 1, to: 10) }
    status_id                 { Faker::Number.between(from: 1, to: 6) }
    ship_charge_id            { Faker::Number.between(from: 1, to: 2) }
    prefecture_id             { Faker::Number.between(from: 1, to: 47) }
    ship_preparation_day_id   { Faker::Number.between(from: 1, to: 3) }
    price                     { Faker::Number.between(from: 300, to: 9999999) }
    association :user
  end
end
