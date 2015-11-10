class UsersController < ApplicationController
	before_action :set_profile


def show
	@profile_reviews = Review.where(user: @profile).order("created_at DESC")
end
	

private
	def set_profile
	    @profile = User.find(params[:id])
	end
end


