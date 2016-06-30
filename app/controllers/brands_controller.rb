class BrandsController < ApplicationController
  before_action :authenticate_user!, only: [:index]

  def index
    @brands = Product.brands
  end
end
