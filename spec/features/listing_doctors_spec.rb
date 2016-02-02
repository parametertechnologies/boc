require 'rails_helper'

RSpec.feature "Users can view a list of doctors" do
  before do
    @trails = [
      create(:doctor, last_name: "Smith"),
      create(:doctor, last_name: "Jones"),
      create(:doctor, last_name: "White")
    ]
  end
  scenario "when visting the home page" do
    visit "/"
    expect(page).to have_content "Doctors"
    expect(page).to have_content "Smith"
    expect(page).to have_content "Jones"
    expect(page).to have_content "White"
  end
end
