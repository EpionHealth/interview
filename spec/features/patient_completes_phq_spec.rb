require "rails_helper"

RSpec.feature "A patient checks into the app" do
  scenario "for a scheduled appointment" do
    visit root_path

    click_on "Start check in"

    expect(page).to have_content "Please complete all of the steps on this page"

    click_on "Start PHQ screener"

    expect(page).to have_content("Over the past 2 weeks, how often have you been bothered by any of the following problems?")

    choose id: "response[0]_1"
    choose id: "response[1]_3"

    click_on "Continue"

    expect(page).to have_content "The depression screener indicated you may have depression. Additional screening should be completed."

    click_on "Start PHQ screener"

    choose id: "response[0]_1"
    choose id: "response[1]_1"

    click_on "Continue"

    expect(page).to have_content "The depression screener indicated you do not currently have signs and symptoms of depression."
  end
end
