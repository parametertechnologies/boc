require 'rails_helper'

RSpec.feature 'Patients are identified by user' do
  let(:user) { create(:user) }

  scenario 'when signed in' do
    login_as user
    patient = create(:patient, user: user)
    visit '/'
    click_link 'Profile'
    expect(page).to have_content patient.full_name
    expect(page).to have_content patient.contact_phone
  end

  scenario 'when not signed in' do
    visit '/'
    expect(page).to have_no_content 'Profile'
  end

end
