class CheckInsController < ApplicationController
  def new
  end

  def create
    redirect_to check_in_path(@check_in)
  end

  def show
    @check_in = CheckIn.find(params[:id])
  end

  ## TODO: Add status to update here to reflect the patient's current process
  def update
    CheckIn.find(params[:id])
    redirect_to new_check_in_path
  end
end
