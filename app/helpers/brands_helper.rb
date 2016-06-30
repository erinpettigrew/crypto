module BrandsHelper
  def render_brand_tiles
    Product.brands.take(4)
  end
end
