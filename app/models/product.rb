class Product < ActiveRecord::Base
	mount_uploader :image, ImageUploader

	searchkick

	has_many :reviews

	validates :product_brand, :product_name, :image, presence: true


end
