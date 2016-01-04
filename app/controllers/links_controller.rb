class LinksController < ApplicationController
 before_action :set_link, only: [:edit, :destroy]


  def new
  	@link = Link.new()
  end

  def create
  	@link = Link.new(link_params)
  	@sites = Site.order(name: :ASC)
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


    def link_params
  	   params.require(:link).permit(:site_id, :url)
    end

end

