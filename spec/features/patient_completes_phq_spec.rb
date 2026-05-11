require "rails_helper"

RSpec.feature "A patient checks into the app" do
  before do
    allow(Net::HTTP).to receive(:get).and_return({ "firstName" => "Terry", "lastName" => "Medhurst" }.to_json)
  end

  scenario "for a scheduled appointment" do
    visit root_path

    click_on "Start check in"

    expect(page).to have_content "Please complete all of the steps on this page"

    click_on "Start PHQ screener"

    expect(page).to have_content("Over the past 2 weeks, how often have you been bothered by any of the following problems?")
  end
end
