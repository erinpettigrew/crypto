class ThemesController < ApplicationController
 before_action :set_theme, only: [:show, :edit, :update, :destroy]
 before_action :authenticate_user!
 before_action :check_user, except: [:show]


  def new
  	@theme = Theme.new
  end

  def create
  	@theme = Theme.new(theme_params)

    respond_to do |format|
      if @theme.save
        format.html { redirect_to @theme, notice: 'Theme was successfully created.' }
        format.json { render :show, status: :created, location: @theme }
      else
        format.html { render :new }
        format.json { render json: @theme.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
  	@themes = Theme.all()
  end

  def show
    @categories = Category.where(theme_id: @theme.id)
    @products = Product.where(theme_id: @theme.id).includes(:reviews, :uses)
    @avg_rating = []
    @review_count = []
    @total_uses = []
    @uses = []
    @use_count = []

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

  def update
    respond_to do |format|
      if @theme.update(theme_params)
        format.html { redirect_to @theme, notice: 'Theme was successfully updated.' }
        format.json { render :show, status: :ok, location: @theme }
      else
        format.html { render :edit }
        format.json { render json: @theme.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  	@theme.destroy
  	  respond_to do |format|
      	format.html { redirect_to product_url, notice: 'This was successfully destroyed.' }
      	format.json { head :no_content }
      end
  end


private

  	def set_theme
      @theme = Theme.friendly.find(params[:id])
    end

    def theme_params
  	   params.require(:theme).permit(:name, :info)
    end

    def check_user
      unless current_user.admin?
        redirect_to root_url, alert: "Sorry, only admins can do that!"
      end
    end

end
