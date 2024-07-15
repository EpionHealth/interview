class ApplicationController < ActionController::Base
  before_action :set_patient, only: [:new, :create]
  before_action :set_check_in_id, only: [:create]

  def set_patient
    response = UsersApi.fetch(id: 1)

    if response.present?
      @patient = Patient.find_or_create_by(id: response["id"]) do |p|
        p.first_name = response["firstName"]
        p.last_name = response["lastName"]
        p.maiden_name = response["maidenName"]
        p.age = response["age"]
        p.gender = response["gender"]
        p.email = response["email"]
        p.phone = response["phone"]
        p.username = response["username"]
        p.birth_date = response["birthDate"]
      end
    else
      @patient = Patient.create(first_name: "Terry", last_name: "Medhurst")
    end
  end

  def set_check_in_id
    @check_in = CheckIn.create(patient_id: @patient.id)
    if @check_in.save
      @check_in_id = @check_in.id
    else
      @check_in_id = 1
    end
  end
end
