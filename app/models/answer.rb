class Answer < ApplicationRecord
  belongs_to :check_in
  belongs_to :question
end
