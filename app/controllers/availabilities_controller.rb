class AvailabilitiesController < ApplicationController

  def show
    product = ProductImporter.new(params[:url])
    product_data = product.import
    render json: product_data
  end

end
