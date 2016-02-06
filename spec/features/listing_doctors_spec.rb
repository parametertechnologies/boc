require 'rails_helper'

RSpec.feature "Patients can view a list of doctors" do
  let(:user) { create(:user) }

  before do
    @patient = create(:patient, user: user)
    @doctors = [
      create(:doctor, last_name: "Smith"),
      create(:doctor, last_name: "Jones"),
      create(:doctor, last_name: "White")
    ]
    login_as user
  end
  
  scenario 'when visting the patient listing page' do
    visit '/'
    click_link "Doctors"
    expect(page).to have_content "Doctors"
    expect(page).to have_content "Smith"
    expect(page).to have_content "Jones"
    expect(page).to have_content "White"
  end
end
