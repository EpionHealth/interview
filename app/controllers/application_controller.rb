class ApplicationController < ActionController::Base
  before_action :set_check_in_id, only: [:create]

  def set_check_in_id
    @check_in = CheckIn.create(patient_id: @patient.id)
    if @check_in.save
      @check_in_id = @check_in.id
    else
      @check_in_id = 1
    end
  end
end
