class CheckInsController < ApplicationController
  def new
  end

  def create
    check_in = CheckIn.create(patient: current_patient)
    redirect_to check_in_path(check_in)
  end

  def show
    @check_in = CheckIn.find(params[:id])
  end

  def update
    CheckIn.find(params[:id])
    redirect_to new_check_in_path
  end

  def depression_screener_new
    @check_in = CheckIn.find(params[:check_in_id])

    render 'check_ins/screeners/depression/new'
  end

  def depression_screener_create
    @check_in = CheckIn.find(params[:check_in_id])

    @scores = params[:response].values
    @scores.map! { |element| element.to_i }

    @result = calculate_depression_score

    puts "Result: #{@result}"
  end

  private

  def calculate_depression_score
    if @scores.any? { |score| score >= 2 }
      'high'
    else
      'low'
    end
  end
end
