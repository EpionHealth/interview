require "rails_helper"

RSpec.feature "A patient checks into the app" do
  scenario "for a scheduled appointment" do
    visit root_path

    click_on "Start check in"

    expect(page).to have_content "Please complete all of the steps on this page"

    click_on "Start PHQ screener"

    expect(page).to have_content("Over the past 2 weeks, how often have you been bothered by any of the following problems?")
  end

  scenario "complete phq with some question value is greater than two" do
    visit root_path

    click_on "Start check in"

    find(:css, "#phq_question1[value='0']").set(true)
    find(:css, "#phq_question2[value='3']").set(true)

    click_on "Complete check in"

    expect(page).to have_content("You will need additional screening")
  end

  scenario "complete phq with some question value is less than two" do
    visit root_path

    click_on "Start check in"

    find(:css, "#phq_question1[value='1']").set(true)
    find(:css, "#phq_question2[value='1']").set(true)

    click_on "Complete check in"

    expect(page).to have_content("Your check_in was updated")
  end

  scenario "send phq with some question value blank" do
    visit root_path

    click_on "Start check in"

    find(:css, "#phq_question1[value='1']").set(true)

    click_on "Complete check in"

    expect(page).to have_content("Question2 can't be blank")

    find(:css, "#phq_question2[value='1']").set(true)

    click_on "Complete check in"

    expect(page).to have_content("Question1 can't be blank")
  end
end
