class BrandsController < ApplicationController
  def index
    @brands = Product.brands
  end
end
