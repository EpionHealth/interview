RSpec.describe PhqScreener, type: :model do
  describe "#total_score" do
    it "sums question 1 and question 2 scores" do
      screener = build(:phq_screener, question_1_score: 2, question_2_score: 3)
      expect(screener.total_score).to eq(5)
    end
  end

  describe "#additional_screening_needed?" do
    context "when both scores are low (0 or 1)" do
      it "returns false" do
        screener = build(:phq_screener, question_1_score: 1, question_2_score: 1)
        expect(screener.additional_screening_needed?).to be false
      end
    end

    context "when question 1 is high (>= 2)" do
      it "returns true" do
        screener = build(:phq_screener, question_1_score: 2, question_2_score: 0)
        expect(screener.additional_screening_needed?).to be true
      end
    end

    context "when question 2 is high (>= 2)" do
      it "returns true" do
        screener = build(:phq_screener, question_1_score: 0, question_2_score: 3)
        expect(screener.additional_screening_needed?).to be true
      end
    end

    context "when both questions are high (>= 2)" do
      it "returns true" do
        screener = build(:phq_screener, question_1_score: 3, question_2_score: 2)
        expect(screener.additional_screening_needed?).to be true
      end
    end
  end

  describe "validations" do
    it "is invalid without question_1_score" do
      screener = build(:phq_screener, question_1_score: nil)
      expect(screener).not_to be_valid
    end

    it "is invalid without question_2_score" do
      screener = build(:phq_screener, question_2_score: nil)
      expect(screener).not_to be_valid
    end

    it "is invalid without a check_in" do
      screener = build(:phq_screener, check_in: nil)
      expect(screener).not_to be_valid
    end
  end
end