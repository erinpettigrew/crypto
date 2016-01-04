class LinksController < ApplicationController
 before_action :set_link, only: [:destroy]
 before_action :set_product


  def new
  	@link = Link.new
    @sites = Site.order(name: :ASC)
  end

  def create
  	@link = Link.new(link_params)
  	@sites = Site.order(name: :ASC)
    @link.product_id = @product.id

    respond_to do |format|
      if @link.save
        format.html { redirect_to products_path, notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @link }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
  	@link.destroy
  	  respond_to do |format|
      	format.html { redirect_to product_url, notice: 'This was successfully destroyed.' }
      	format.json { head :no_content }
      end
  end


private

  	def set_link
      @link = Link.find(params[:id])
    end

    def set_product
      @product = Product.friendly.find(params[:product_id])
    end

    def link_params
  	   params.require(:link).permit(:site_id, :url)
    end

end

