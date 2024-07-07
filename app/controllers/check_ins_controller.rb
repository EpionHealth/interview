class CheckInsController < ApplicationController


  def new
  end

  def create
    # get the patient's first name and last name from an external api
    check_in = CheckIn.create(
      patient_id: "1"
    )

    patient = Patient.find_or_create_by(id: check_in.patient_id.to_i)

    if patient.first_name.nil? && patient.last_name.nil?
      url = "https://dummyjson.com/users/#{check_in.patient_id}"

      result = HTTParty.get(url)

      patient.first_name = result.parsed_response["firstName"]
      patient.last_name = result.parsed_response["lastName"]

      patient.save!
    end

    redirect_to check_in_path(check_in)
  end

  def show
    @check_in = CheckIn.find(params[:id])
    @patient = Patient.find(@check_in.patient_id.to_i)
  end

  def update
    question_1 = params[:question_1].to_i
    question_2 = params[:question_2].to_i
    screening_needed = question_1 > 1 || question_2 > 1

    @check_in = CheckIn.find(params[:id])

    @check_in.update(
      question_1: question_1,
      question_2: question_2,
      screening_needed: screening_needed
    )
    redirect_to check_in_path
  end
end
