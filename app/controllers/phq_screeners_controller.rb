class PhqScreenersController < ApplicationController
  def new
  end

  def create
    @phq_screener = PhqScreener.new(
      question_1_score: phq_screener_params[:question_1_score],
      question_2_score: phq_screener_params[:question_2_score],
      check_in: current_check_in
    )

    if @phq_screener.save
      redirect_to check_in_path(current_check_in), notice: screening_message(@phq_screener)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def phq_screener_params
    params.require(:phq_screener).permit(:question_1_score, :question_2_score)
  end

  def current_check_in
    @current_check_in ||= CheckIn.find(params[:check_in_id])
  end

  def screening_message(screener)
    if screener.additional_screening_needed?
      "Based on your responses, additional screening should be completed."
    else
      "Based on your responses, additional screening is not needed."
    end
  end
end