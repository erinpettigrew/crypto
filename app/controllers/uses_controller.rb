class UsesController < ApplicationController
  # before_action :set_product, only: [:destroy]

  def new
    @use = Use.new
  end

  def create
    @use = Use.create(use_params)
    render json: { use: render_to_string('uses/_use-small', layout: false, locals: { use: @use }) }
  end

  def destroy
    product = @product = Product.friendly.find(params[:product_id])
    @use = Use.where(product: product, user: current_user)
    @use.destroy_all
    render json: { id: current_user.id}
  end

  private
  def set_product
    @product = Product.friendly.find(params[:id])
  end

  def use_params
    params.permit(:product_id, :user_id)
  end
end
