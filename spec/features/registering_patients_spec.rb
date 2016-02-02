require "rails_helper"

RSpec.feature "Patients can register with the site" do
  before do
    visit "/"
    click_link "Register as new patient"
  end
  scenario "with valid attributes" do
    fill_in "First name", with: "Joe"
    fill_in "Last name", with: "Smith"
    fill_in "Contact phone", with: "928-227-4444"
    click_button "Register"

    expect(page).to have_content "Patient registered"
  end

  scenario "when providing invalid attributes" do
    click_button "Register"
    expect(page).to have_content "Patient not registered"
    expect(page).to have_content "can't be blank"
    expect(page).to have_selector "abbr", count: 3
  end
end
