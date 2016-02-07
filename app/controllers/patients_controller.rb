class PatientsController < ApplicationController
  before_action :authenticate_user!, only: [:show, :new, :create]

  def index
    if user_has_patient?
      @patient_gps = current_user.patients.first.gps
    else
      @patient_gps = location_not_known
    end
    
    @doctors_gps = Doctor.gps_list
  end

  def show
    @patient = Patient.find(params[:id])
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.user = current_user
    @patient.gps = location_not_known ## replace with Geolocation service call

    if @patient.save
      flash[:notice] = 'Patient registered.'
      redirect_to @patient
    else
      flash[:alert] = 'Patient not registered.'
      render 'new'
    end
  end

  private

  def patient_params
    params.require(:patient).permit(
      :first_name,
      :last_name,
      :contact_phone)
  end

  def location_not_known
     '{"lat": 32.222605, "lng": -110.974710}'
  end

  def user_has_patient?
    current_user && current_user.patients.any?
  end
end
