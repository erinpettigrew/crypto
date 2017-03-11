class Post < ActiveRecord::Base
  belongs_to :user
  mount_uploader :image, ImageUploader

  has_many :product_posts
  has_many :products, through: :product_posts
end
