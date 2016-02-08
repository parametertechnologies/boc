=begin
 TODO: 
 - tried moving common concern methods shared with controllers/doctors_controller
   into concerns/doctors/controller_concers with no luck
 - two controllers for doctor seems like a bad thing
 - need to identify use cases for user, doctor, and admin and determine how to divide
   these into controller responsibilities
 DRG 2/6/16
=end
class Admin::DoctorsController < AdminController

  # TODO: duplicates controllers/doctors_controller.rb
  def index
    @doctors = Doctor.all.order(:last_name)
  end

  # TODO: duplicates controllers/doctors_controller.rb
  def show
    @doctor = Doctor.find(params[:id])
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    @doctor.gps = location_not_known #replace with gps service for real-time location

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

  def location_not_known
     '{"lat": 32.222605, "lng": -110.974710}'
  end

end
