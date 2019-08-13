class CheckInsController < ApplicationController
  before_action :set_check_in, only: [:show, :update]
  before_action :build_form, only: :update

  def new
  end

  def create
    check_in = CheckIn.create(patient: current_patient)
    redirect_to check_in_path(check_in)
  end

  def show
    @form = HealtQuestionaryForm.new(check_in: @check_in)
  end

  def update
    @form.call
    if @form.success
      redirect_to new_check_in_path, notice: @form.give_notice
    else
      render :show
    end
  end

  private

  def phq_params
    params.require(:phq).permit(:question1, :question2) if params[:phq].present?
  end

  def set_check_in
    @check_in = CheckIn.find(params[:id])
  end

  def build_form
    @form = HealtQuestionaryForm.new({
      check_in: @check_in,
      phq_params: phq_params
    })
  end
end
