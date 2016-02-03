require "rails_helper"

RSpec.feature "Doctors can register with the site" do
  before do
    visit doctors_path
    click_link "Register as new doctor"
  end
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

end
