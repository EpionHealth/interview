require "rails_helper"

RSpec.feature "A patient checks into the app" do
  let!(:screener) { create(:screener, name: "PHQ") }
  let!(:question_1) { create(:question, id: 1, prompt: "Little interest or pleasure in doing things?", screener: screener) }
  let!(:question_2) { create(:question, id: 2, prompt: "Feeling down, depressed or hopeless?", screener: screener) }
  let!(:patient) { create(:patient) }

  scenario "for a scheduled appointment" do
    stub_request(:get, "https://dummyjson.com/users/#{patient.id}")
      .to_return(status: 200, body: {firstName: patient.name}.to_json)

    visit root_path

    expect(page).to have_content "Welcome #{patient.name}"

    click_on "Start check in"

    expect(page).to have_content "Please complete all of the steps on this page"

    click_on "Start PHQ screener"

    expect(page).to have_content("Over the past 2 weeks, how often have you been bothered by any of the following problems?")
    expect(page).to have_content("Little interest or pleasure in doing things?")

    within(".question", text: "Little interest or pleasure in doing things?") do
      choose "question[#{question_1.id}]", option: "0"
    end

    within(".question", text: "Feeling down, depressed or hopeless?") do
      choose "question[#{question_2.id}]", option: "1"
    end

    click_on "Complete check in"

    expect(page).to have_content "Thank you, additional screening is not needed"
  end

  scenario "Additional screening is required" do
    stub_request(:get, "https://dummyjson.com/users/#{patient.id}")
      .to_return(status: 200, body: {firstName: patient.name}.to_json)

    visit root_path

    expect(page).to have_content "Welcome #{patient.name}"

    click_on "Start check in"

    expect(page).to have_content "Please complete all of the steps on this page"

    click_on "Start PHQ screener"

    expect(page).to have_content("Over the past 2 weeks, how often have you been bothered by any of the following problems?")
    expect(page).to have_content("Little interest or pleasure in doing things?")

    within(".question", text: "Little interest or pleasure in doing things?") do
      choose "question[#{question_1.id}]", option: "2"
    end

    within(".question", text: "Feeling down, depressed or hopeless?") do
      choose "question[#{question_2.id}]", option: "3"
    end

    click_on "Complete check in"

    expect(page).to have_content "Additional screening should be completed"
  end
end
