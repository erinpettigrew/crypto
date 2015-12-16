class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all.order('name ASC')
    @products = []
    @product1 = []
    @product2 = []
    @product3 = []

    for singlecategory in @categories
      @products << Product.where(category_id: singlecategory.id).first
      @product1 << Product.where(category_id: singlecategory.id).first
      @product2 << Product.where(category_id: singlecategory.id).second
      @product3 << Product.where(category_id: singlecategory.id).third
      # as soon as the above turns into an array with first(n), I get problems
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @products = Product.where(category_id: @category.id).order("updated_at DESC") 

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


  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :description)
    end
end
