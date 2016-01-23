class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :like, :use, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :check_user, except: [:search, :index, :show, :create, :new, :like, :use, :update]
  before_action :set_categories, only: [:new, :edit, :create, :update]

  def search
    if params[:search].present?
      @products = Product.search(params[:search])
    else
      @products = Product.all? #show all products if search is blank
    end

     @search_term = params[:search]
     @avg_rating = []
     @review_count = []
 
     for singleproduct in @products
       @reviews = Review.where(product_id: singleproduct.id)
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

    @products = Product.all.order('updated_at DESC').take(1)
    @recent_reviews = Review.all.order('created_at DESC').take(15)
    @new_products = Product.all.order('created_at DESC').take(5)

    @avg_rating_recent = []
    @review_count_recent = []

    for singlerecent_review in @recent_reviews
      @avg_rating_recent << 3
      @review_count_recent << 4
    end

    end



  # GET /products/1
  # GET /products/1.json
  def show
    @reviews = Review.where(product_id: @product.id).order("created_at DESC") 
    @number_of_likes = Like.where(product_id: @product.id).size
    @number_of_uses = Use.where(product_id: @product.id).size
    @links = Link.where(product_id: @product.id).order("created_at DESC")

    if @reviews.blank?
      @avg_rating = 0
    else
    @avg_rating = @reviews.average(:rating).round(2)
    end

    @photos = Photo.where(product_id: @product.id).order("created_at DESC")
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

      #notice: "You started using #{@product.product_brand} #{@product.product_name}"

    elsif type == 'unuse'
      current_user.used_products.delete(@product)
      redirect_to :back

      #notice: "You started using #{@product.product_brand} #{@product.product_name}"

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

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
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

    def set_categories
      @categories = Category.all.order(name: :ASC)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:product_brand, :product_name, :image, :category_id, :user_id, :ingredients)
    end

end
