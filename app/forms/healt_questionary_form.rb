class HealtQuestionaryForm
  include ActiveModel::Model

  validates :question1, :question2, presence: true

  attr_accessor :question1, :question2, :success

  def initialize(params = {})
    @check_in = params[:check_in]
    @success = false
    set_question params[:phq_params]
  end

  def call
    if valid?
      update_score
      @success = true
    end
  end

  def update_score
    @check_in.update(score: @phq.sum)
  end

  def need_additional_screening?
    @phq.any? { |score| score >= 2 }
  end

  def give_notice
    need_additional_screening? ? 'You will need additional screening' : 'Your check_in was updated'
  end

  def parse_question(question)
    Integer(question || '')
    rescue
      nil
  end

  def set_question(phq_params)
    if phq_params.present?
      @question1 = parse_question phq_params[:question1]
      @question2 = parse_question phq_params[:question2]
      @phq = [@question1, @question2]
    end
  end
end