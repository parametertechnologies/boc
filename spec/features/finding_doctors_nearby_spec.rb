require "rails_helper"

RSpec.feature "Patients can find doctors nearby" do
  let(:user) { create(:user)}

  before do
    login_as user
  end

  scenario "when viewing the home page" do
    visit "/"
    patient_gps = '{"lat": 32.234138, "lng": -110.917638}'
    doctors_gps = '[{"lat": 32.236161, "lng": -110.892576},'
    doctors_gps << '{"lat": 32.228864, "lng": -110.901256},'
    doctors_gps << '{"lat": 32.159587, "lng": -111.008552}]'
    expect(page).to have_selector "div#map"
    expect(page).to have_css "div[data-patient_gps='#{patient_gps}']"
    expect(page).to have_css "div[data-doctors_gps='#{doctors_gps}']"
  end
end
