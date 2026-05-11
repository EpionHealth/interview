class PhqScreener < ApplicationRecord
  belongs_to :check_in

  SCORE_OPTIONS = {
    "Not at all" => 0,
    "Several days" => 1,
    "More than half the days" => 2,
    "Nearly every day" => 3
  }.freeze

  validates :question_1_score, presence: true
  validates :question_2_score, presence: true

  def total_score
    question_1_score + question_2_score
  end

  def additional_screening_needed?
    question_1_score >= 2 || question_2_score >= 2
  end
end