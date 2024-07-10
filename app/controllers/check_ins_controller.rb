# frozen_string_literal: true

class CheckInsController < ApplicationController
  before_action :set_user, only: :new
  before_action :set_questions, only: [:new]
  before_action :set_check_in, only: [:show]

  def new
    @check_in = CheckIn.new
    flash[:notice] = "Hi #{@user.full_name}!"
  end

  def create
    @check_in = CheckIn.new(check_in_params)

    if @check_in.save
      score_message
      redirect_to check_in_path(@check_in)
    else
      render :new
    end
  end

  def show; end

  private

  def score_message
    if @check_in.high_score?
      flash[:notice] = 'High score detected. Additional screening is recommended.'
    else
      flash[:alert] = 'No additional screening needed.'
    end
  end

  def set_check_in
    @check_in = CheckIn.find(params[:id])
  end

  def set_questions
    @questions = Question.all
  end

  def set_user
    @user = User.find(1)
  end

  def check_in_params
    params.require(:check_in).permit(:patient_id, answers_attributes: %i[question_id title _destroy])
  end
end
