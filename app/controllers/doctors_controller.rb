class DoctorsController < ApplicationController
  def index
    @doctors = Doctor.all
  end

  def show
    @doctor = Doctor.find(params[:id])
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)

    if @doctor.save
      flash[:notice] = 'Doctor registered.'
      redirect_to @doctor
    else
      flash[:alert] = 'Doctor not registered.'
      render 'new'
    end
  end

  private

  def doctor_params
    params.require(:doctor).permit(
      :first_name,
      :last_name,
      :speciality,
      :contact_phone)
  end
end
