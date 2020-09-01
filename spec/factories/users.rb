FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 4) + 'a1'}
    password_confirmation {password}
    firstname             { '東京' }
    lastname              { '太郎' }
    firstname_kana        { 'トウキョウ' }
    lastname_kana         { 'タロウ' }
    birthday              { '1930-01-02' }
  end
end
