class CheckInsController < ApplicationController
  def show
    @check_in = CheckIn.find(params[:id])
    screener_name = params[:screener_name] || "PHQ"  # assumption that client has a drop down of screeners and they choose one from available screeners
    @screener = Screener.find_by(name: screener_name)
    @check_in.check_in_screeners.create(screener_id: @screener.id)
  end

  def new
  end

  def create
    check_in = CheckIn.create(patient_id: current_patient.id)
    redirect_to check_in_path(check_in)
  end

  def update
    CheckIn.find(params[:id])
    redirect_to new_check_in_path
  end

  private

  def current_patient
    patient_id = params[:patient_id] || Patient.last.id
    @patient = Patient.find(patient_id)
  end
end
