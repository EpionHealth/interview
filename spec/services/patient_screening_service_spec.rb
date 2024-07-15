require "rails_helper"

RSpec.describe PatientScreeningService do
  subject { described_class.new(params: params, check_in_id: 1, screening_type_id: 1) }

  describe ".process" do
    before do
      subject.process
    end

    context "when total score is low" do
      let(:params) do
        {
          "question_1": 0,
          "question_2": 1
        }
      end

      it "returns normal disclaimer" do
        expect(subject.status).to eq(described_class::DISCLAIMER_MESSAGE[:normal])
      end

      it "creates PatientScreening" do
        expect(subject.patient_screening).to be_a(PatientScreening)
      end

      it "calculates total_store to be 0" do
        expect(subject.total_score).to eq(0)
      end
    end

    context "when total score is high" do
      let(:params) do
        {
          "question_1": 3,
          "question_2": 1
        }
      end

      it "returns normal disclaimer" do
        expect(subject.status).to eq(described_class::DISCLAIMER_MESSAGE[:high])
      end

      it "creates PatientScreening" do
        expect(subject.patient_screening).to be_a(PatientScreening)
      end

      it "calculates total_store to be 1" do
        expect(subject.total_score).to eq(1)
      end
    end
  end
end
