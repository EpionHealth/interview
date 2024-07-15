FactoryBot.define do
    factory :patient_screening do
      patient { create(:patient) }
      screening_type { create(:screening_type) }
      check_in { create(:check_in) }
    end
  end
  