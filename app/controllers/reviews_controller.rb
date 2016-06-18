class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]
  before_action :set_product
  before_action :authenticate_user!
  before_action :check_user, only: [:edit, :update, :destroy]

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.product_id = @product.id

    $tracker.track(current_user.id, 'Added Review', {
      'Product ID' => @product.id,
      'Product Name' => @product.product_brand + " " + @product.product_name
      })

      respond_to do |format|
        if @review.save
          format.html { redirect_to @product, notice: 'Thank you for your review! It helps all of us make better purchases.' }
          format.json { render :show, status: :created, location: @review }
        else
          format.html { render :new }
          format.json { render json: @review.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @review.update(review_params)
          format.html { redirect_to product_path(@product), notice: 'Review was successfully updated.' }
          format.json { render :show, status: :ok, location: @review }
        else
          format.html { render :edit }
          format.json { render json: @review.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @review.destroy
      respond_to do |format|
        format.html { redirect_to product_path(@product), notice: 'Review was successfully destroyed.' }
        format.json { head :no_content }
      end
    end

    private
    def set_review
      @review = Review.find(params[:id])
    end

    def set_product
      @product = Product.friendly.find(params[:product_id])
    end

    def check_user
      unless (@review.user == current_user) || (@current_user.admin?)
        redirect_to root_url, alert: "Sorry, this review belongs to someone else"
      end
    end

    def review_params
      params.require(:review).permit(:rating, :comment)
    end
  end
