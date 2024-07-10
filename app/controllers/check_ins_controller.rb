class CheckInsController < ApplicationController
  def new
    @check_in = CheckIn.new
    @questions = Question.all
  end

  def create
    check_in = CheckIn.create(patient_id: "1")
    redirect_to check_in_path(check_in)
    @check_in = CheckIn.new(check_in_params)

    if @check_in.save
      if @check_in.high_score?
        flash[:notice] = "High score detected. Additional screening is recommended."
      else
        flash[:alert] = "No additional screening needed."
      end
      redirect_to check_in_path(@check_in)
    else
      render :new
    end
  end

  def show
    @check_in = CheckIn.find(params[:id])
  end

  def update
    CheckIn.find(params[:id])
    redirect_to new_check_in_path
  private 

  def check_in_params
    params.require(:check_in).permit(:patient_id, answers_attributes: [:question_id, :title])
  end
end
