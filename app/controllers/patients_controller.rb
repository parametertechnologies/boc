class PatientsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @patient_gps = '{"lat": 32.234138, "lng": -110.917638}'
    @doctors_gps = '[{"lat": 32.236161, "lng": -110.892576},'
    @doctors_gps << '{"lat": 32.228864, "lng": -110.901256},'
    @doctors_gps << '{"lat": 32.159587, "lng": -111.008552}]'
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
end
