require "rails_helper"

RSpec.feature "Patients can find doctors nearby" do
  let(:user) { create(:user)}

  before do
    patient = create(:patient, user: user)
    @patient_gps = patient.gps
    login_as user
  end

  scenario "when viewing the home page" do
    visit "/"
    doctors_gps = '[{"lat": 32.236161, "lng": -110.892576},'
    doctors_gps << '{"lat": 32.228864, "lng": -110.901256},'
    doctors_gps << '{"lat": 32.159587, "lng": -111.008552}]'
    expect(page).to have_selector "div#map"
    expect(page).to have_css "div[data-patient_gps='#{@patient_gps}']"
    expect(page).to have_css "div[data-doctors_gps='#{doctors_gps}']"
  end
end


# Implementation Notes

# 1. Add attribute Patient#gps to store gps coords of their home location:
#   '{"lat": 32.234138, "lng": -110.917638}'
#
# 2. Add attribute Doctor#gps to store gps coords of where the are currently located:
#   '[{"lat": 32.236161, "lng": -110.892576},'
#
# 3. Will need a service that will update doctor models with their current gps cords
