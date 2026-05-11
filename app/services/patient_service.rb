class PatientService
  BASE_URL = "https://dummyjson.com/users".freeze

  def self.find(patient_id)
    response = Net::HTTP.get(URI("#{BASE_URL}/#{patient_id}"))
    data = JSON.parse(response)
    new(data)
  end

  attr_reader :first_name, :last_name

  def initialize(data)
    @first_name = data["firstName"]
    @last_name = data["lastName"]
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end