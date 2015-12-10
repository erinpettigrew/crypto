class LikesController < ApplicationController
before_action :set_category, only: [:destroy]
  before_action :set_product
  before_action :authenticate_user!


	def new 
		@like = Like.new
	end

	def create
		@like = Like.new(like_params)
    	@like.user_id = current_user.id
    	@like.product_id = @product.id
	end

  def destroy
    @like.destroy
    respond_to do |format|
      format.html { redirect_to product_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def like_params
      params.require(:like).permit(:product_id, :user_id)
    end

end
