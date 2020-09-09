FactoryBot.define do
  factory :purchase_shippingaddress do
    token                            { Faker::Lorem.characters(number: 20) }
    postal_code                      { '100-0000' }
    prefecture_id                    { Faker::Number.between(from: 1, to: 47) }
    city                             { 'あいうえ市' }
    address                          { '１−２−３' }
    building                         { 'かきくけビル' }
    phone_number                     { '07000000000' }
  end
end
