require 'rails_helper'

RSpec.feature "Users can view a list of doctors" do
  scenario "when visting the home page" do
    visit "/"
    expect(page).to have_content "Doctors"
  end
end
