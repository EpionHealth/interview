RSpec.describe "PHQ Screener", type: :feature do
  let(:check_in) { create(:check_in) }

  before do
    visit new_phq_screener_path(check_in_id: check_in.id)
  end

  it "displays the PHQ-2 instructions" do
    expect(page).to have_text("Over the past 2 weeks, how often have you been bothered by any of the following problems?")
  end

  it "displays both questions" do
    expect(page).to have_text("Little interest or pleasure in doing things?")
    expect(page).to have_text("Feeling down, depressed or hopeless?")
  end

  it "displays all answer options for each question" do
    expect(page).to have_text("Not at all", count: 2)
    expect(page).to have_text("Several days", count: 2)
    expect(page).to have_text("More than half the days", count: 2)
    expect(page).to have_text("Nearly every day", count: 2)
  end

  context "when additional screening is not needed" do
    it "shows the appropriate message" do
      choose "q1_0"
      choose "q2_1"
      click_button "Submit"
      expect(page).to have_text("additional screening is not needed")
    end
  end

  context "when additional screening is needed" do
    it "shows the appropriate message when question 1 is high" do
      choose "q1_2"
      choose "q2_0"
      click_button "Submit"
      expect(page).to have_text("additional screening should be completed")
    end

    it "shows the appropriate message when question 2 is high" do
      choose "q1_0"
      choose "q2_3"
      click_button "Submit"
      expect(page).to have_text("additional screening should be completed")
    end

    it "shows the appropriate message when both questions are high" do
      choose "q1_3"
      choose "q2_2"
      click_button "Submit"
      expect(page).to have_text("additional screening should be completed")
    end
  end
end