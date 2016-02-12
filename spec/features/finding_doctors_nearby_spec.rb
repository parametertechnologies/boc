require "rails_helper"

RSpec.feature "Patients can find doctors nearby" do
  let(:user) { create(:user)}

  before do
    patient = create(:patient, user: user)
    @doctors = [create(:doctor), create(:doctor2), create(:doctor3)]
    @patient_gps = patient.gps
    @doctors_gps = "[#{@doctors.map {|d| "#{d.gps}"}.join(',')}]"
    login_as user
  end

  scenario "when viewing the home page" do
    visit "/"
    expect(page).to have_selector "div#map"
    expect(page).to have_css "div[data-patient_gps='#{@patient_gps}']"
  end

  scenario "hidden data is rendered for map info windows" do
    visit "/"
    have_hidden "div#patient"
    have_hidden "div#patient p#full_name"
    have_hidden "div#patient p#contact_phone"

    @doctors.each do |doctor|
      selector = "div#doctor_#{doctor.id}"
      have_hidden selector
      have_hidden "#{selector} p#full_name"
      have_hidden "#{selector} p#speciality"
      have_hidden "#{selector} p#contact_phone"
      have_hidden "#{selector} p#gps"
    end
  end

  private

  def have_hidden(selector)
    expect(page).to have_selector selector, visible: false
  end
end
