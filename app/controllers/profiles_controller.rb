class ProfilesController < ApplicationController
  def show
    @patients = current_user.patients
  end
end
