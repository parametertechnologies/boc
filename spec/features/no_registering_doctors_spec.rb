require "rails_helper"

RSpec.feature "Users cannot" do
  before do
    visit doctors_path
  end
  scenario 'create a doctor account' do
    expect(page).not_to have_content "Register as a new doctor"
  end
=begin registration moved to admin function for MVP
  scenario "with valid attributes" do
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Smith"
    fill_in "Speciality", with: "Family Practice Physician"
    fill_in "Contact phone", with: "928-227-3333"
    click_button "Register"

    expect(page).to have_content "Doctor registered"
  end

  scenario "when providing invalid attributes" do
    click_button "Register"

    expect(page).to have_content "Doctor not registered."
    expect(page).to have_content "can't be blank"
    expect(page).to have_selector "abbr", count: 4
  end
=end
end
