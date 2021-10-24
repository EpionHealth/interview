class CheckInsController < ApplicationController
  before_action :set_check_in, except: [:new, :create]

  def new() end

  def create
    check_in = CheckIn.create(patient: current_patient)
    redirect_to check_in_path(check_in)
  end

  def show() end

  def update
    redirect_to new_check_in_path
  end

  def depression_screener_new
    render 'check_ins/screeners/depression/new'
  end

  def depression_screener_create
    @scores = params[:response].values
    @scores.map! { |element| element.to_i }

    @check_in.depression_screen_result = calculate_depression_score

    @check_in.save

    if @check_in.depression_screen_result == 'high'
      notice = 'The depression screener indicated you may have depression. Additional screening should be completed.'
    else
      notice = 'The depression screener indicated you do not currently have signs and symptoms of depression.'
    end

    redirect_to check_in_path(@check_in), notice: notice
  end

  private

  def set_check_in
    @check_in = CheckIn.find(params[:id])
  end

  def calculate_depression_score
    if @scores.any? { |score| score >= 2 }
      'high'
    else
      'low'
    end
  end
end
