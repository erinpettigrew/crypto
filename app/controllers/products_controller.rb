class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :like, :use, :want, :destroy]
  before_action :authenticate_user!, except: [:search, :show, :index, :new, :create]
  before_action :check_user, except: [:search, :index, :show, :create, :new, :like, :use, :want, :update]
  before_action :set_categories, only: [:new, :edit, :create, :update]
  before_action :set_themes, only: [:new, :edit, :create, :update]

  def search
      @query = params[:search]
      # @products = Product.search(params[:search], include: [ { uses: { user: :avatar } }, :reviews])
      @products = Product.search(params[:search])
      @exchanges = Exchange.search(params[:search])
      # @categories = Category.search(params[:search], include: [:products])
      # @categories = Category.search(params[:search])
      # @default = Category.all.includes(:products)
  end

  def index
    @products = Product.all
  end

  def show
    @review = Review.new
  end

  def new
    @product = Product.new
    @product.category_id = 1 #default to category 1 for now
  end

  def newadmin
    @product = Product.new
    @categories = Category.all
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

      # $tracker.track(current_user.id, 'Added Use', {
      #   'Product ID' => @product.id,
      #   'Product Name' => @product.name
      #   })
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

        # $tracker.track(current_user.id, 'Added Want', {
        #   'Product ID' => @product.id,
        #   'Product Name' => @product.name
        #   })
        elsif type == 'unwant'
          current_user.wanted_products.delete(@product)
          redirect_to :back
        else
          redirect_to :back, notice: 'Nothing happened.'
        end
      end

      def edit
      end

      def create
        @product = Product.new(product_params)
        @product.remote_image_url = product_params[:image]
        @product.user_id = current_user.id
        @product.category_id = 1
        @product.theme_id = @product.category.theme_id
        respond_to do |format|
          if @product.save
            format.html { redirect_to @product, notice: 'Product was successfully created.' }
            format.json { render :show, status: :created, location: @product }

            # $tracker.track(current_user.id, 'Added Product', {
            #   'Product ID' => @product.id,
            #   'Product Name' => @product.name
            #   })
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
          params.require(:product).permit(:name, :device, :image, :category_id, :user_id, :about, :theme_id, :link, :rating, :location, :url, :founded_date, :access_private_keys, :popular, :popular_more)
        end

      end
