class PatientScreening < ApplicationRecord
  belongs_to :patient
  belongs_to :screening_type
  belongs_to :check_in
end
