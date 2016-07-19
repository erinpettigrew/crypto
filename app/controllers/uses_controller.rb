class UsesController < ApplicationController
  before_action :authenticate_user!

  def new
    @use = Use.new
  end

  def toggle
    product = Product.friendly.find(params[:product_id])
    if product.uses.where(user: current_user).any?
      @use = Use.where(product: product, user: current_user)
      @use.destroy_all
      render json: { id: current_user.id}
    else
      @use = Use.create(use_params)
      render json: { use: render_to_string('uses/_use-small', layout: false, locals: { use: @use }) }
    end
  end

  private
  def use_params
    params.permit(:product_id, :user_id)
  end
end
