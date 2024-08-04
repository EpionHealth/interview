require "rails_helper"

module CheckIns
  module Screeners
    RSpec.describe ResultsController, type: :controller do
      describe "#show" do
        let(:check_in) { create(:check_in) }
        let!(:check_in_screener) { create(:check_in_screener, check_in: check_in) }
        let(:screener) { check_in.screeners.last }

        context "when answers choices are 3 or 4" do
          let(:question) { create(:question, id: 1, screener: screener) }
          let(:choice) { 3 }

          before do
            check_in.answers.create!(question: question, choice: choice)
          end

          it "renders the view" do
            get :show, params: {check_in_id: check_in.id, screener_id: screener.id}

            expect(response).to render_template(:show)
            expect(response).to render_with_layout(:application)
            expect(assigns(:display_additional_screening)).to be true
          end
        end

        context "when answers choices are 1 or 2" do
          it "renders the view" do
            get :show, params: {check_in_id: check_in.id, screener_id: screener.id}

            expect(response).to render_template(:show)
            expect(response).to render_with_layout(:application)
            expect(assigns(:display_additional_screening)).to be false
          end
        end
      end
    end
  end
end
