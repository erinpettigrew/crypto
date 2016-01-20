class UsersController < ApplicationController
	before_action :set_profile


def show
	@profile_photos = Photo.where(user: @profile).order("created_at DESC")
	@profile_reviews = Review.where(user: @profile).order("created_at DESC")

  @products_added = Product.where(user_id: @profile).count
  @reviews_added = @profile_reviews.count

	@products = @profile.liked_products.order("created_at DESC")


    @avg_rating = []
    @review_count = []
    @new = []
    @most_reviewed = []
    @review = []


    @looping = 0

   for singleproduct in @products
      @reviews = Review.where(product_id: singleproduct.id)
      @review << Review.where(product_id: singleproduct.id).last

        if @reviews.blank?
          @avg_rating << 0
          @review_count << 0
          @new << true

        else
          @avg_rating << @reviews.average(:rating).round(2) 
          @review_count << @reviews.size
          @new << false
        end

        if @reviews.size >= 2
          @most_reviewed << true
        else
          @most_reviewed << false
        end
    end
end
	

private
	def set_profile
	    @profile = User.friendly.find(params[:id])
	end
end


