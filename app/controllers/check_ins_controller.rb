class CheckInsController < ApplicationController
  before_action :current_patient, only: [:new]

  def show
    @check_in = CheckIn.find(params[:id])
  end

  def new
    @check_in = CheckIn.new
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
