class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :like, :use, :want, :destroy]
  before_action :authenticate_user!
  before_action :check_user, except: [:search, :index, :show, :create, :new, :like, :use, :want, :update]
  before_action :set_categories, only: [:new, :edit, :create, :update]
  before_action :set_themes, only: [:new, :edit, :create, :update]

  def search
    if params[:brand]
      @query = params[:brand]
      @products = Product.search(@query, fields: [:product_brand])
      @categories = []
    else
      @query = params[:search]
      @products = Product.search(params[:search])
      @categories = Category.search(params[:search])
      @default = Category.all
    end
  end

  def index
    @rand_categories = Category.all.sample(4)
    @products = Product.take(30).sample(8)
    @brands = Product.brands.sample(4)
    recent_reviews = Review.last(8)
    recent_uses = Use.last(12)
    @activity = (recent_reviews + recent_uses).sort_by(&:created_at).reverse.first(8)
    @popular_products = Product.find(Product.joins(:uses).group('products.id').order("count(*) desc").limit(3).ids)
    @recent_posts = Post.all.order(created_at: :desc).includes(:user => :avatar).take(3)
  end

  def show
    @review = Review.new
  end

  def like
    type = params[:type]
    if type == 'like'
      current_user.liked_products << @product
      redirect_to :back
    elsif type == 'unlike'
      current_user.liked_products.delete(@product)
      redirect_to :back
    else
      redirect_to :back
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
      elsif type == 'unuse'
        current_user.used_products.delete(@product)
        redirect_to :back
      else
        redirect_to :back
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
        elsif type == 'unwant'
          current_user.wanted_products.delete(@product)
          redirect_to :back
        else
          redirect_to :back, notice: 'Nothing happened.'
        end
      end

      def new
        @product = Product.new
      end

      def edit
      end

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

        def destroy
          @product.destroy
          respond_to do |format|
            format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
            format.json { head :no_content }
          end
        end

        private
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
          @categories = Category.all.order(name: :asc)
        end

        def product_params
          params.require(:product).permit(:product_brand, :product_name, :image, :category_id, :user_id, :ingredients, :theme_id)
        end

      end
