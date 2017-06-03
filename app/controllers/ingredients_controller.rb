class IngredientsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @ingredients = Product.ingredients
  end
end
