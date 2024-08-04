require 'rails_helper'

module CheckIns
  RSpec.describe ScreenersController, type: :controller do
    describe '#create' do
      let(:check_in) { create(:check_in) }
      let!(:check_in_screener) { create(:check_in_screener, check_in: check_in) }
      let!(:screener) { check_in.screeners.last }
      let(:question) { create(:question, screener: screener) }
      let(:question2) { create(:question, screener: screener) }

      let(:answer_params) do
        {
          question.id => "2", # question_id => answer_choice
          question2.id => "3"
        }
      end

      it 'saves the answers and redirects to the result path' do
        post :create, params: { check_in_id: check_in.id, question: answer_params }

        expect(check_in.answers.count).to eq(2)
        expect(check_in.answers.first.choice).to eq(2)
        expect(response).to redirect_to(check_in_screener_result_path(check_in, screener))
      end
    end
  end
end
