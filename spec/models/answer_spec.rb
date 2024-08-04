require 'rails_helper'

RSpec.describe Answer, type: :model do
  let(:check_in) { create(:check_in) }

  describe 'validations' do
    it { should validate_presence_of(:choice) }
    it { should validate_inclusion_of(:choice).in_array(Answer::VALID_CHOICES) }
  end

  describe '#display_additional_screening?' do
    context 'when question_id is 1' do
      let(:question_1) { create(:question, id: 1) }
      let(:answer_1) { create(:answer, check_in: check_in, question: question_1) }

      it 'returns true if choice is 2 or greater' do
        answer_1.choice = 2
        expect(answer_1.display_additional_screening?).to be true
      end

      it 'returns false if choice is less than 2' do
        answer_1.choice = 1
        expect(answer_1.display_additional_screening?).to be false
      end
    end

    context 'when question_id is 2' do
      let(:answer_2) { create(:answer, check_in: check_in, question: question_2) }
      let(:question_2) { create(:question, id: 2) }

      it 'returns true if choice is 2 or greater' do
        answer_2.choice = 2
        expect(answer_2.display_additional_screening?).to be true
      end

      it 'returns false if choice is less than 2' do
        answer_2.choice = 1
        expect(answer_2.display_additional_screening?).to be false
      end
    end

    context 'when question_id is neither 1 nor 2' do
      it 'returns nil' do
        question_3 = create(:question, id: 3)
        answer_3 = create(:answer, check_in: check_in, question: question_3, choice: 2)
        expect(answer_3.display_additional_screening?).to be false
      end
    end
  end
end
