class Look < ActiveRecord::Base
  belongs_to :user
  has_many :look_products
  has_many :products, through: :look_products
end
