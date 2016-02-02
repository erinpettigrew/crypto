class UsersController < ApplicationController
	before_action :set_profile
	before_action :authenticate_user! #remove when out of preview beta


def show
	@profile_photos = Photo.where(user: @profile).order("created_at DESC")
	@profile_reviews = Review.where(user: @profile).order("created_at DESC")

  @products_added = Product.where(user_id: @profile).count
  @reviews_added = @profile_reviews.count
end
	

private
	def set_profile
	    @profile = User.friendly.find(params[:id])
	end
end


