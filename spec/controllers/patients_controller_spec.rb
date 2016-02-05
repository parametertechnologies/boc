require 'rails_helper'

RSpec.describe PatientsController, type: :controller do
  let(:user) { create(:user) }
  let(:patient) { create(:patient, user: user) }

  before do
    allow(controller).to receive(:authenticate_user!)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe 'GET show' do
    it 'assigns @patient' do
      get :show, params: {id: patient.id }
      expect(assigns(:patient)).to eq patient
    end
  end

  describe 'GET new' do
    it 'assigns @patient' do
      get :new
      expect(assigns(:patient))
    end
  end

  describe 'POST create' do
    it 'assigns @patient' do
      post :create, params: { patient: {
        first_name: 'Tim', last_name: 'Smith', contact_phone: '929-277-4444'} }

      expect(assigns(:patient).last_name).to eq 'Smith'
      expect(response).to redirect_to assigns(:patient)
    end
  end

end
