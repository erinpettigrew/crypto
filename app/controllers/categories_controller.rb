class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :set_themes, only: [:new, :show, :index, :edit, :create, :update]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @themes = Theme.all.includes(:categories => :products).order(created_at: :asc)
    @categories = Category.all.includes(:products).order(name: :asc)
  end

  def show
    @products = @category.products.includes([:reviews], [:uses => [:user => :avatar]]).order(created_at: :desc)
  end

  def new
    @category = Category.new
  end

  def edit
  end

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

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_category
    @category = Category.friendly.find(params[:id])
  end

  def set_themes
    @themes = Theme.all
  end

  def category_params
    params.require(:category).permit(:name, :description, :theme_id)
  end
end
