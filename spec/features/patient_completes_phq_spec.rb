require "rails_helper"

RSpec.feature "A patient checks into the app" do
  let(:screening_type) { create(:screening_type) }

  before do
    allow(ScreeningType).to receive(:find_by).and_return(screening_type)
  end

  scenario "for a scheduled appointment" do
    visit root_path

    click_on "START"

    expect(page).to have_content "Please complete all of the steps on this page"

    click_on "START PHQ SCREENING"

    expect(page).to have_content("Over the past 2 weeks, how often have you been bothered by any of the following problems?")
  end
end
