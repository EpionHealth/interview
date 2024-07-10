FactoryBot.define do
  factory :user do
    first_name { "John" }
    last_name { "Doe" }
    maiden_name { "Smith" }
    email { "john.doe@example.com" }
    phone { "+1234567890" }
  end
end
