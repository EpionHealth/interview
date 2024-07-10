# frozen_string_literal: true

class User < ApplicationRecord
  validates :first_name, :last_name, :email, presence: true

  def full_name
    "#{first_name} #{last_name}".strip
  end
end
