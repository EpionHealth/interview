FactoryBot.define do
  factory :patient do
    id { 1 }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    maiden_name { Faker::Name.middle_name }
    age { Faker::Number.number(digits: 2) }
    gender { Faker::Gender.type }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
    username { Faker::Internet.username }
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 110) }
  end
end
