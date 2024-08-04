class PatientInfoService
  API_URL = "https://dummyjson.com/users"

  def self.call(patient_id)
    new(patient_id).call
  end

  def initialize(patient_id)
    @patient_id = patient_id
  end

  def call
    response = HTTPX.get("#{API_URL}/#{@patient_id}")
    body = JSON.parse(response.body)
    case response.status
    when 200
      body
    else
      Rails.logger("status: #{response.status}, body: #{body}")
      # throw a rollbar or some other kind of error alerting
    end
  end
end
