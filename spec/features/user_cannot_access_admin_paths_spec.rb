require 'rails_helper'

RSpec.feature "Users cannot access" do
  let(:user) { create(:user)}

  before do
    login_as user
  end

  scenario "admin page" do
    visit '/admin'

    expect(page).to have_content "You do not have sufficient privileges"
    expect(current_path).to eq '/'
  end
end