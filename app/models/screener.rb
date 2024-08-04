class Screener < ApplicationRecord
  validates :name, presence: true

  has_many :questions
  has_many :check_in_screeners
  has_many :check_ins, through: :check_in_screeners
end
