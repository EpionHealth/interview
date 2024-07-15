class Patient < ApplicationRecord
  validates :first_name, presence: true
end
