class Product < ActiveRecord::Base
	mount_uploader :image, ImageUploader

	has_many :reviews

	validates :product_brand, :product_name, :image, presence: true
end
