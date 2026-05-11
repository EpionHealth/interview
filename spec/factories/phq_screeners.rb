FactoryBot.define do
  factory :phq_screener do
    question_1_score { 0 }
    question_2_score { 0 }
    association :check_in
  end
end