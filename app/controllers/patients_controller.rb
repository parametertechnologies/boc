class PatientsController < ApplicationController

  def show
    @patient = Patient.find(params[:id])
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.new(patient_params)

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
