class PatientScreeningService
  attr_reader :check_in_id, :params, :patient_screening, :status, :screening_type_id, :total_score

  DISCLAIMER_MESSAGE = {
    high: "Based on the information provided, further screening is necessary to ensure we provide you with the best care possible.",
    normal: "Additional screening is not necessary"
  }.freeze

  def initialize(params:, check_in_id:, screening_type_id:)
    @params = params
    @check_in_id = check_in_id
    @screening_type_id = screening_type_id
  end

  ##
  # Analyze and capture screening results based on patient's
  # input by calculating the total_score and find the
  # associated disclaimer message
  # @return [ScreeningService]
  def process
    if high_status.present?
      @total_score = 1
      @status = DISCLAIMER_MESSAGE[:high]
    else
      @total_score = 0
      @status = DISCLAIMER_MESSAGE[:normal]
    end

    @patient_screening = PatientScreening.create(
      check_in_id: check_in_id,
      patient_id: params[:patient_id],
      screening_type_id: screening_type_id,
      total_score: total_score
    )

    self
  end

  ##
  # Retrieve any question's score that is deemed high
  # @return [Integer | nil]
  def high_status
    @high_status ||= scores.find { |score| high?(score) }
  end

  ##
  # Determine the question's score based on the patient's answer
  # @param [Integer]
  # @return [Boolean]
  def high?(score)
    score >= 2
  end

  def scores
    @scores ||= score_params
  end

  ##
  # Collect all question_* answers
  # @return [Array<Integer>]
  def score_params
    formatted = []
    params.each do |k, v|
      if k != "patient_id"
        formatted.push(v.to_i)
      end
    end

    formatted
  end
end
