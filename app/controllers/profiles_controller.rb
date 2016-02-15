class ProfilesController < ApplicationController
	before_action :set_user
	before_action :set_profile, only: [:edit, :update, :destroy]


def new
	 @profile = Profile.new
end


def create
	@profile = Profile.new(profile_params)
    @profile.user_id = current_user.id

     respond_to do |format|
      if @profile.save
        format.html { redirect_to user_path(current_user), notice: 'Your skin info was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @avatar.errors, status: :unprocessable_entity }
      end
    end
end

def edit
end


def update
	 respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @user, notice: 'Skin info was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end

end


def destroy
end


private

    def profile_params
      params.require(:profile).permit(:user_id, :skin_type)
    end

    def set_user
    	@user = current_user
    end

    def set_profile
    	@profile = Profile.find(params[:id])
    end

end
