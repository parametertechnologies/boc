class AdminController < ApplicationController

  before_action :require_admin

protected

  def require_admin
    unless admin?
      flash[:error] = "You do not have sufficient privileges for the requested action"
      redirect_to '/'
    end
  end

  def admin?
    !current_user.nil? && current_user.admin?
  end


end
