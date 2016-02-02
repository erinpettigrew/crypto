class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?


protected

#	def after_sign_in_path_for(resource_or_scope)
#	end

	# after sign out, keep user on same page (rather than redirecting away)

	def after_sign_out_path_for(resource_or_scope)
		URI.parse(request.referer).path if request.referer
	end


  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :user_name
    devise_parameter_sanitizer.for(:account_update) << :user_name
    # override defaults and force user name to be accepted on devise accept invitation method
    devise_parameter_sanitizer.for(:accept_invitation) << :user_name
  end
end
