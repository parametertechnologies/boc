require "rails_helper"

RSpec.feature "User can view a doctor" do
  before do
    @doctor = create(:doctor)
  end

  scenario "when clicking on doctor's name from index" do
    visit doctors_path
    click_link @doctor.last_name
    expect(page).to have_content @doctor.full_name
    expect(page).to have_content @doctor.speciality
    expect(page).to have_content @doctor.contact_phone
  end

end
