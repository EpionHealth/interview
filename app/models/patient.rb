class Patient < ApplicationRecord
  has_many :check_in
end
