require 'rails_helper'

RSpec.describe Admin::DoctorsController, type: :controller do
  let(:user) { create(:user) }
  let(:admin) { create(:admin) }
  let(:doctor) { create(:doctor) }

  before do
    allow(controller).to receive(:authenticate_user!)
    allow(controller).to receive(:current_user).and_return(admin)
  end

  describe 'GET show' do
    it 'assigns @doctor' do
      get :show, params: {id: doctor.id }
      expect(assigns(:doctor)).to eq doctor
    end
  end

  describe 'GET new' do
    it 'assigns @doctor' do
      get :new
      expect(assigns(:doctor))
    end
  end

  describe 'POST create' do
    it 'assigns @doctor' do
      post :create, params: { doctor: {
        first_name: 'Tim', last_name: 'Smith', speciality: 'Quackery', contact_phone: '929-277-4444'} }

      expect(assigns(:doctor).last_name).to eq 'Smith'
      expect(response).to redirect_to :action => :show,
                                      :id => assigns(:doctor).id
    end
  end

end
