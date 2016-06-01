class WantsController < ApplicationController
  before_action :set_category, only: [:destroy]
  before_action :set_product
  before_action :authenticate_user!

  def new
    @want = Want.new
  end

  def create
    @want = Want.new(want_params)
    @want.user_id = current_user.id
    @want.product_id = @product.id
  end

  def destroy
    @use.destroy
    respond_to do |format|
      format.html { redirect_to product_url, notice: 'This was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_use
    @use = Use.find(params[:id])
  end

  def use_params
    params.require(:use).permit(:product_id, :user_id)
  end
end
