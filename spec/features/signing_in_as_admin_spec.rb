require "rails_helper"

RSpec.feature "Admins can sign in" do
  let!(:admin) { create(:admin)}

  scenario "with valid credentials" do
    visit "/"
    click_link "Sign in"
    fill_in "Email", with: admin.email
    fill_in "Password", with: "password"
    click_button "Sign in"

    expect(page).to have_content "Signed in successfully."
    expect(page).to have_content "Signed in as #{admin.email}"
    expect(page).to have_content "Admin"
  end
end
