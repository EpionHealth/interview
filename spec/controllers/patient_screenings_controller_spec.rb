require "rails_helper"

RSpec.describe PatientScreeningsController, type: :controller do
  let(:patient) { create(:patient) }
  let(:screening_type) { create(:screening_type) }
  let(:check_in) { create(:check_in, id: 1) }

  before do
    allow(UsersApi).to receive(:fetch).and_return(patient.as_json)
    allow(ScreeningType).to receive(:find_by).and_return(screening_type)
    allow(CheckIn).to receive(:create).and_return(check_in)
  end

  describe "routing" do
    it { should route(:get, "/patient_screenings/new").to(action: :new) }
    it { should route(:post, "/patient_screenings").to(action: :create) }
  end

  describe "GET #new" do
    it "renders the view" do
      get :new

      expect(response).to render_template(:new)
      expect(response).to render_with_layout(:application)
    end
  end

  describe "POST #create" do
    let(:patient_screening) { create(:patient_screening, patient_id: patient.id, screening_type_id: screening_type.id) }
    let(:screening_service) { instance_double(PatientScreeningService) }
    let(:screening_service_params) { instance_double(PatientScreeningService, params: { "patient_id": 1 }, check_in_id: check_in.id, screening_type_id: screening_type.id, patient_screening: patient_screening)}

    before do
      allow(PatientScreeningService).to receive(:new).and_return(screening_service)
      allow(screening_service).to receive(:process).and_return(screening_service_params)
    end
    it "renders the view" do
      post :create

      expect(response).to render_template(:create)
      expect(response).to render_with_layout(:application)
    end
  end
end
