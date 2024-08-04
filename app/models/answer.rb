class Answer < ApplicationRecord
  # assuming every answer is an integer with 4 choices. If there's answers with
  # different type of structure, we could add a table
  VALID_CHOICES = [0, 1, 2, 3]

  belongs_to :question
  belongs_to :check_in

  validates :choice, presence: true, inclusion: {in: VALID_CHOICES}

  def display_additional_screening?
    case question_id
    when 1
      choice >= 2
    when 2
      choice >= 2
    else
      false
    end
  end
end
