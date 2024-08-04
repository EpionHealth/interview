module CheckIns
  class ScreenersController < ApplicationController
    before_action :check_in

    def show
      @screener = Screener.find(params[:id])
      check_in.check_in_screeners.create(screener_id: @screener.id)
      @questions = @screener.questions
    end

    def create
      params[:question].each do |question_id, answer|
         ans = check_in.answers.new(question_id: question_id, choice: answer)
         ans.save
      end
      redirect_to check_in_screener_result_path(check_in, check_in.screeners.first)
    end

    private

    def check_in
      @check_in = CheckIn.find(params[:check_in_id])
    end

    def patient
      @patient = Patient.find(params[:patient_id])
    end
  end
end
