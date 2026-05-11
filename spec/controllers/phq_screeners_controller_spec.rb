RSpec.describe PhqScreenersController, type: :controller do
  let(:check_in) { create(:check_in) }
  let(:patient_data) { { "firstName" => "Terry", "lastName" => "Medhurst" } }

  before do
    allow(Net::HTTP).to receive(:get).and_return(patient_data.to_json)
  end

  describe "GET #new" do
    it "renders the new template" do
      get :new, params: { check_in_id: check_in.id }
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:valid_params) do
        {
          check_in_id: check_in.id,
          phq_screener: { question_1_score: 1, question_2_score: 0 }
        }
      end

      it "creates a PHQ screener" do
        expect { post :create, params: valid_params }.to change(PhqScreener, :count).by(1)
      end

      it "redirects to check_in_path" do
        post :create, params: valid_params
        expect(response).to redirect_to(check_in_path(check_in))
      end

      context "when additional screening is not needed" do
        it "sets a notice that additional screening is not needed" do
          post :create, params: valid_params
          expect(flash[:notice]).to match(/additional screening is not needed/i)
        end
      end

      context "when additional screening is needed" do
        let(:valid_params) do
          {
            check_in_id: check_in.id,
            phq_screener: { question_1_score: 2, question_2_score: 3 }
          }
        end

        it "sets a notice that additional screening should be completed" do
          post :create, params: valid_params
          expect(flash[:notice]).to match(/additional screening should be completed/i)
        end
      end
    end

    context "with invalid params" do
      let(:invalid_params) do
        {
          check_in_id: check_in.id,
          phq_screener: { question_1_score: nil, question_2_score: nil }
        }
      end

      it "does not create a PHQ screener" do
        expect { post :create, params: invalid_params }.not_to change(PhqScreener, :count)
      end

      it "renders the new template" do
        post :create, params: invalid_params
        expect(response).to render_template(:new)
      end
    end
  end
end