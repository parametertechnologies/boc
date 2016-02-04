require "rails_helper"

RSpec.feature "Users are identified" do
  let(:user) { create(:user) }
  before do
    login_as user
    @patient = create(:patient, user: user)
  end

  scenario "when signed in" do
    visit "/"
    click_link "Profile"
    expect(@patient.user).to eq user
    expect(page).to have_content @patient.full_name
  end
end
