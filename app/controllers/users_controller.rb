class UsersController < ApplicationController
	before_action :set_user, only: [:show]
	before_action :authenticate_user! #remove when out of preview beta


def show
	@user_photos = Photo.where(user: @user).order("created_at DESC")
	@user_reviews = Review.where(user: @user).order("created_at DESC")

  @products_added = Product.where(user_id: @user).count
  @reviews_added = @user_reviews.count
end
	
def index
	@users = User.where.not(slug: nil).order("created_at DESC") #only show users with a username slug to avoid showing /users# instead
end

private
	def set_user
	    @user = User.friendly.find(params[:id])
	end
end


