class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :configure_permitted_parameters, if: :devise_controller?
  #before_action :set_user

  private

  #def set_user
  ##	@user = current_user
  #end

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :birthday])
  end

  def after_sign_in_path_for(resource)
 	newsfeed_path(resource)
  end
end
