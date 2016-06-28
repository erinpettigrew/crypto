class UsesController < ApplicationController
  before_action :set_product, only: [:destroy]

  def new
    @use = Use.new
  end

  def create
    @use = Use.create(use_params)
    render nothing: true
  end

  def destroy
    binding.pry
    @use.destroy
    respond_to do |format|
      format.html { redirect_to product_url, notice: 'This was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_product
    @product = Product.friendly.find(params[:id])
  end

  def use_params
    params.permit(:product_id, :user_id)
  end
end
