class UsersController < ApplicationController
	before_action :set_user, only: [:show]
	before_action :authenticate_user! #remove when out of preview beta

	def show
		@user_reviews = @user.reviews.includes(:product).order(created_at: :desc)

		if @user.profile.present? && @user.profile.skin_type_id.present?
			@skin_type = SkinType.find_by(id: @user.profile.skin_type_id)
		end

		@products_added = Product.where(user_id: @user).count
		@reviews_added = @user_reviews.count
	end

	def index
		@users = User.includes(:avatar, :profile).where.not(slug: nil).order(created_at: :desc)
		if current_user.profile.present? && current_user.profile.skin_type_id.present?
			@skin_type = SkinType.find_by(id: current_user.profile.skin_type_id)
		end
	end

	private
	def set_user
		@user = User.friendly.find(params[:id])
	end
end
