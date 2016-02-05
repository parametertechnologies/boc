require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  let(:user) { create(:user) }
  let(:patients) do
    [create(:patient, first_name: "Mike", user: user),
     create(:patient, first_name: "Sally", user: user)]
  end

  before do
    allow(controller).to receive(:authenticate_user!)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe "GET #show" do
    it "assigns @patients" do
      get :show
      expect(response).to have_http_status(:success)
      expect(assigns(:patients)).to eq patients
    end
  end

end
