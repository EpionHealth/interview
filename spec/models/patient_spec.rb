require "rails_helper"

RSpec.describe Patient, type: :model do
  describe "#info" do
    let(:patient) { create(:patient) }
    let(:patient_info) { double("PatientInfo") }

    before do
      allow(PatientInfoService).to receive(:call).with(patient.id).and_return(patient_info)
    end

    it "calls PatientInfoService with the correct patient id" do
      patient.info # This will trigger the PatientInfoService call
      expect(PatientInfoService).to have_received(:call).with(patient.id)
    end

    it "returns the result of PatientInfoService" do
      expect(patient.info).to eq(patient_info)
    end
  end
end
