class ApplicationController < ActionController::Base
  before_filter :store_current_location, :unless => :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def disable_nav
  	@disable_nav = true
  end

  def disable_footer
  	@disable_footer = true
  end

protected

  # after sign in, retrieves the user's most recent page
	def after_sign_in_path_for(resource_or_scope)
		session["user_return_to"] || root_path
	end

	# after sign out, keep user on same page (rather than redirecting away)
	def after_sign_out_path_for(resource_or_scope)
		# session["user_return_to"] || root_path
		URI.parse(request.referer).path if request.referer #when no longer under preview mode
	end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :user_name
    devise_parameter_sanitizer.for(:account_update) << :user_name
    # override defaults and force user name to be accepted on devise accept invitation method
    devise_parameter_sanitizer.for(:accept_invitation) << :user_name
  end

  private
  # override the devise helper to store the current location so we can
  # redirect to it after loggin in or out. This override makes signing in
  # and signing up work automatically.
  def store_current_location
    store_location_for(:user, request.url)
  end
end
