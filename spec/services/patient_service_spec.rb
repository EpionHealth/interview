RSpec.describe PatientService do
  describe ".find" do
    let(:patient_data) do
      { "firstName" => "Terry", "lastName" => "Medhurst" }
    end

    before do
      allow(Net::HTTP).to receive(:get).and_return(patient_data.to_json)
    end

    it "returns a patient with the correct first name" do
      patient = PatientService.find(1)
      expect(patient.first_name).to eq("Terry")
    end

    it "returns a patient with the correct last name" do
      patient = PatientService.find(1)
      expect(patient.last_name).to eq("Medhurst")
    end

    it "returns the correct full name" do
      patient = PatientService.find(1)
      expect(patient.full_name).to eq("Terry Medhurst")
    end
  end
end