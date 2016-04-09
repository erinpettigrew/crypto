class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :like, :use, :want, :destroy]
  before_action :authenticate_user! #switch to below version when moving out of preview beta
  #before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :check_user, except: [:search, :index, :show, :create, :new, :like, :use, :want, :update]
  before_action :set_categories, only: [:new, :edit, :create, :update]
  before_action :set_themes, only: [:new, :edit, :create, :update]


  def search
    if params[:search].present?
      @products = Product.includes(:reviews, :uses).search(params[:search])
    else
      @products = Product.includes(:reviews, :uses).all? #show all products if search is blank
    end

     @search_term = params[:search]
     @avg_rating = []
     @review_count = []
     @use_count = []
     @uses = []
 
     for singleproduct in @products
       @reviews = singleproduct.reviews
       @uses = singleproduct.uses
       @use_count << @uses.size
      if @reviews.blank?
         @avg_rating << 0
         @review_count << 0
      else
         @avg_rating << @reviews.average(:rating).round(2) 
         @review_count << @reviews.size
      end
     end
 
  end

  # GET /products
  # GET /products.json
  def index
    @product_count = Product.all.count
    @review_count = Review.all.count
    @used_basic_products = []
    @used_advanced_products = []
    @basic_products_count = 0
    @themes = Theme.first(3)
    @categories = Category.order("RANDOM()").first(3)

    for singletheme in @themes
        @used_basic_products << current_user.used_products.where(theme_id: singletheme.id).first
        if @used_basic_products.last != nil
          @basic_products_count += 1
        end
    end

    for singlecategory in @categories
      @used_advanced_products << current_user.used_products.where(category_id: singlecategory.id).first
    end

    @recent_reviews = Review.all.order('created_at DESC').take(15)
    @recent_uses = Use.all.order('created_at DESC').take(12)
    @recent_wants = Want.all.order('created_at DESC').take(12)
    @recent_posts = Post.all.order('created_at DESC').take(9)
    @recent_actions = (@recent_reviews + @recent_uses + @recent_wants + @recent_posts).sort_by(&:created_at).reverse

    # get user's avatar or provide a default avatar
    @avatar_file = ""
    if current_user.avatar != nil
      @avatar_file = current_user.avatar.image
    else
      @avatar_file = "https://s3.amazonaws.com/productbase/hearts/black-heart.png"
    end

  end



  # GET /products/1
  # GET /products/1.json
  def show
    @reviews = @product.reviews.order("created_at DESC")
    # @number_of_likes = @product.likes.size
    @links = @product.links.order("created_at DESC")
    @uses = @product.uses.order("created_at DESC")
    @number_of_uses = @uses.size
    @wants = @product.wants.order("created_at DESC")
    @number_of_wants = @wants.size
    # @photos = @product.photos.order("created_at DESC")
    if @reviews.blank?
      @avg_rating = 0
    else
      @avg_rating = @reviews.average(:rating).round(2)
    end
  end

  def like
    type = params[:type]
    if type == 'like'
      current_user.liked_products << @product
      redirect_to :back
      #notice: "You liked #{@product.product_brand} #{@product.product_name}"
    elsif type == 'unlike'
      current_user.liked_products.delete(@product)
      redirect_to :back
      #notice: "You unliked #{@product.product_brand} #{@product.product_name}"
    else
      redirect_to :back, notice: 'Nothing happened.'
    end
  end

  def use
    type = params[:type]
    if type == 'use'
      current_user.used_products << @product
      redirect_to :back

    $tracker.track(current_user.id, 'Added Use', {
    'Product ID' => @product.id,
    'Product Name' => @product.product_brand + " " + @product.product_name
      })

      #notice: "You started using #{@product.product_brand} #{@product.product_name}"

    elsif type == 'unuse'
      current_user.used_products.delete(@product)
      redirect_to :back

      #notice: "You started using #{@product.product_brand} #{@product.product_name}"

    else
      redirect_to :back, notice: 'Nothing happened.'
    end
  end

  def want
    type = params[:type]
    if type == 'want'
      current_user.wanted_products << @product
      redirect_to :back

    $tracker.track(current_user.id, 'Added Want', {
    'Product ID' => @product.id,
    'Product Name' => @product.product_brand + " " + @product.product_name
      })

      #notice: "You want #{@product.product_brand} #{@product.product_name}"

    elsif type == 'unwant'
      current_user.wanted_products.delete(@product)
      redirect_to :back

      #notice: "You stopped wanting #{@product.product_brand} #{@product.product_name}"

    else
      redirect_to :back, notice: 'Nothing happened.'
    end
  end


  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    @product.theme_id = @product.category.theme_id

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }

    $tracker.track(current_user.id, 'Added Product', {
    'Product ID' => @product.id,
    'Product Name' => @product.product_brand + " " + @product.product_name
      })
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.friendly.find(params[:id])
    end

    def check_user
      unless current_user.admin?
        redirect_to root_url, alert: "Sorry, only admins can do that!"
      end
    end

    def set_themes
      @themes = Theme.all
    end

    def set_categories
      @categories = Category.all.order("name ASC")
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:product_brand, :product_name, :image, :category_id, :user_id, :ingredients, :theme_id)
    end

end
