class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    # if user declines to share their email address
    # if @user.email.blank?
    #   redirect_to "/users/auth/facebook?auth_type=rerequest&scope=email"
    # end

    # match to existing user if exists, else create new user
    if User.where(email: @user.email).any?
      @existing_user = User.where(email: @user.email).first
    else
      @user
    end

    # on creating a new user, callbacks send us here
    if !@existing_user.nil?
      sign_in_and_redirect @existing_user, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      if @user.persisted?
        sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
      else
        session["devise.facebook_data"] = request.env["omniauth.auth"]
        redirect_to root_path
      end
    end
  end

  def failure
    redirect_to root_path
  end
end
