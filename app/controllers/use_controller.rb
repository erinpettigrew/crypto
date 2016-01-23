class UseController < ApplicationController
before_action :set_category, only: [:destroy]
  before_action :set_product
  before_action :authenticate_user!


	def new 
		@use = Use.new
	end

	def create
		@use = Use.new(like_params)
    	@use.user_id = current_user.id
    	@use.product_id = @product.id
	end

  def destroy
    @use.destroy
    respond_to do |format|
      format.html { redirect_to product_url, notice: 'This was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_use
      @use = Use.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def use_params
      params.require(:use).permit(:product_id, :user_id)
    end

end
