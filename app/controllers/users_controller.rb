class UsersController < ApplicationController
	before_action :set_user, only: [:show]
	before_action :authenticate_user! #remove when out of preview beta


def show
	@user_photos = Photo.where(user: @user).order("created_at DESC")
	@user_reviews = Review.where(user: @user).order("created_at DESC")

	if @user.profile.present? && @user.profile.skin_type_id.present?
		@skin_type = SkinType.find_by(id: @user.profile.skin_type_id)
	end

  @products_added = Product.where(user_id: @user).count
  @reviews_added = @user_reviews.count


  # get user's avatar or provide a default avatar
  @avatar_file = ""
  if @user.avatar != nil
    @avatar_file = @user.avatar.image
  else
    @avatar_file = "https://s3.amazonaws.com/productbase/hearts/black-heart.png"
  end
end
	
def index
	@users = User.where.not(slug: nil).order("created_at DESC") #only show users with a username slug to avoid showing /users# instead
	if current_user.profile.present? && current_user.profile.skin_type_id.present?
		@skin_type = SkinType.find_by(id: current_user.profile.skin_type_id)
	end
end

private
	def set_user
	    @user = User.friendly.find(params[:id])
	end
end


