require_relative "../services/patient_screening_service.rb"

class PatientScreeningsController < ApplicationController
  before_action :set_screening_type, only: [:new, :create]
  before_action :set_questions, only: [:new]
  before_action :set_answers, only: [:new]

  def new
  end

  def create
    @screening_service = PatientScreeningService.new(
      params: permitted_params,
      check_in_id: @check_in_id,
      screening_type_id: @screening_type.id
    ).process

    if @screening_service.patient_screening.valid?
      render :create
    else
      render :new
    end
  end

  private

  def permitted_params
    params.reject { |k, _| ["controller", "action", "authenticity_token", "commit"].include?(k) }
  end

  def set_screening_type
    @screening_type = ScreeningType.find_by(name: "PHQ-9")
  end

  def set_questions
    @questions = Question.where(screening_type_id: @screening_type.id)
  end

  def set_answers
    @answers = AnswerOption.where(screening_type_id: @screening_type.id)
  end
end

