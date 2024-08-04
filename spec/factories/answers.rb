FactoryBot.define do
  factory :answer do
    choice { 1 }
    question
    check_in
  end
end
