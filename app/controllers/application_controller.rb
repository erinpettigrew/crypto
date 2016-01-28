class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :user_name
    devise_parameter_sanitizer.for(:account_update) << :user_name
    # override defaults and force user name to be accepted on devise accept invitation method
    devise_parameter_sanitizer.for(:accept_invitation) << :user_name
  end
end
