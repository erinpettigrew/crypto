class ProductPost < ActiveRecord::Base
  belongs_to :product
  belongs_to :post
end
