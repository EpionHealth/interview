require "rails_helper"

RSpec.describe PatientScreening, type: :model do
  it { is_expected.to belong_to(:patient) }
  it { is_expected.to belong_to(:screening_type) }
  it { is_expected.to belong_to(:check_in) }
end
