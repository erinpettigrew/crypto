class UsersController < ApplicationController
	before_action :set_profile, only: [:show]
	before_action :authenticate_user! #remove when out of preview beta


def show
	@profile_photos = Photo.where(user: @profile).order("created_at DESC")
	@profile_reviews = Review.where(user: @profile).order("created_at DESC")

  @products_added = Product.where(user_id: @profile).count
  @reviews_added = @profile_reviews.count
end
	
def index
	@users = User.where.not(slug: nil).order("created_at DESC") #only show users with a username slug to avoid showing /users# instead
end

private
	def set_profile
	    @profile = User.friendly.find(params[:id])
	end
end


