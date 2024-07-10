class CheckIn < ApplicationRecord
  has_many :answers, dependent: :destroy
  accepts_nested_attributes_for :answers

  validates :patient_id, presence: true


  def high_score?
    answers.pluck(:title).find{ |title| HIGH_RESPONSE.include?(title) }.present?
  end
end
