require "rails_helper"

RSpec.feature "Doctors can register with the site" do
  scenario "with valid attributes" do
    visit "/"
    click_link "Register as new doctor"
    fill_in "First name", with: "John"
    fill_in "Last name", with: "Smith"
    fill_in "Speciality", with: "Family Practice Physician"
    fill_in "Contact phone", with: "928-227-3333"
    click_button "Register"

    expect(page).to have_content "Doctor registered"
  end

end
