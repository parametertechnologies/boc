require "rails_helper"

RSpec.feature "Patients can find doctors nearby" do
  let(:user) { create(:user)}

  before do
    patient = create(:patient, user: user)
    doctors = [create(:doctor), create(:doctor2), create(:doctor3)]
    @patient_gps = patient.gps
    @doctors_gps = "[#{doctors.map {|d| "#{d.gps}"}.join(',')}]"
    login_as user
  end

  scenario "when viewing the home page" do
    visit "/"
    expect(page).to have_selector "div#map"
    expect(page).to have_css "div[data-patient_gps='#{@patient_gps}']"
    expect(page).to have_css "div[data-doctors_gps='#{@doctors_gps}']"
  end
end
