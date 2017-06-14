class UsersController < ApplicationController
	before_action :set_user_custom, only: [:show, :update]
	before_action :authenticate_user!, except: [:show]

	def show
		@user_reviews = @user.reviews.includes(:product).order(created_at: :desc)
		@products_added = Product.where(user_id: @user).count
		@reviews_added = @user_reviews.count
	end

	def index
		@users = User.includes(:avatar, :profile).where.not(slug: nil).order(created_at: :desc)
	end

	def update
		respond_to do |format|
			if @user.update(user_params)
				format.html { redirect_to root_path, notice: 'Welcome!' }
				format.json { render :show, status: :ok, location: @user }
			else
				format.html { render :edit }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	private
	def set_user_custom
		@user = User.friendly.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:user_name)
	end
end
