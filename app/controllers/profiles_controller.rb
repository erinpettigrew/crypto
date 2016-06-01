class ProfilesController < ApplicationController
	before_action :set_profile, only: [:edit, :update, :destroy]
	before_action :set_skin_types, only: [:new, :create, :edit, :update, :destroy]
	before_action :set_user
	before_action :authenticate_user!

	def new
		@profile = Profile.new
	end

	def create
		@profile = Profile.new(profile_params)
		@profile.user_id = current_user.id

		respond_to do |format|
			if @profile.save
				format.html { redirect_to @user }
				format.json { render @user, status: :created, location: @profile }
			else
				format.html { render :new }
				format.json { render json: @profile.errors, status: :unprocessable_entity }
			end
		end
	end

	def edit
	end

	def update
		respond_to do |format|
			if @profile.update(profile_params)
				format.html { redirect_to @user }
				format.json { render :show, status: :ok, location: @profile }
			else
				format.html { render :edit }
				format.json { render json: @profile.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
	end

	private

	def set_profile
		@profile = Profile.find(params[:id])
	end

	def set_skin_types
		@skin_types = SkinType.all
	end

	def set_user
		@user = current_user
	end

	def profile_params
		params.require(:profile).permit(:user_id, :skin_type_id)
	end
end
