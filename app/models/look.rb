class Look < ActiveRecord::Base
  belongs_to :user
  has_many :look_products
  has_many :products, through: :look_products

  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
end
