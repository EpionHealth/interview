class Patient < ApplicationRecord
  has_many :check_in

  def info
    @info ||= PatientInfoService.call(id)
  end
end
