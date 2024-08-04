require "rails_helper"

RSpec.feature "A patient checks into the app" do
  let!(:screener) { create(:screener, name: "PHQ") }
  let!(:question_1) { create(:question, prompt: "Little interest or pleasure in doing things?", screener: screener) }
  let!(:question_2) { create(:question, prompt: "Feeling down, depressed or hopeless?", screener: screener) }

  before do
    create(:patient)
  end

  scenario "for a scheduled appointment" do
    visit root_path

    click_on "Start check in"

    expect(page).to have_content "Please complete all of the steps on this page"

    click_on "Start PHQ screener"

    expect(page).to have_content("Over the past 2 weeks, how often have you been bothered by any of the following problems?")
    expect(page).to have_content("Little interest or pleasure in doing things?")

    within('.question', text: 'Little interest or pleasure in doing things?') do
      choose "question[#{question_1.id}]", option: '0'
    end

    within('.question', text: 'Feeling down, depressed or hopeless?') do
      choose "question[#{question_2.id}]", option: '1'
    end

    click_on "Complete check in"

    expect(page).to have_content "Thank you, additional screening is not needed"
  end
end
