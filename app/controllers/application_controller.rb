class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  after_action :prepare_unobtrusive_flash

  #ActiveAdmin custom authentication method 
  def authenticate_active_admin_user!
      authenticate_user!
    unless current_user.admin?
      flash[:alert] = "Unauthorized Access!"
      redirect_to root_path
    end
  end
  
  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end
  
  def access_denied(exception)
    redirect_to admin_organizations_path, alert: exception.message
  end
  
end