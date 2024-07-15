FactoryBot.define do
  factory :questions do
    id { 1 }
    screen_type_id { 1 }
    description { Faker::Lorem.sentence }
  end
end
