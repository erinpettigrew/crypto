class AvailabilitiesController < ApplicationController

  def show
    product = ProductImporter.new(params[:url])
    product.import
    render json: "hey"
  end

end
