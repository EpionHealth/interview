class Question < ApplicationRecord
  belongs_to :screener
  has_many :answers

  validates :prompt, presence: true
end
