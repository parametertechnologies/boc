require 'rails_helper'

RSpec.feature 'Patients are identified by user' do
  let(:user) { create(:user) }
  before do
    login_as user
    @patient = create(:patient, user: user)
  end

  scenario 'when signed in'do
    visit '/'
    click_link 'Profile'
    expect(page).to have_content @patient.full_name
    expect(page).to have_content @patient.contact_phone
  end
end
