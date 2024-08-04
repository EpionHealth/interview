class CheckIn < ApplicationRecord
  validates :patient_id, presence: true

  has_many :answers
  has_many :check_in_screeners
  has_many :screeners, through: :check_in_screeners
  belongs_to :patient
end
