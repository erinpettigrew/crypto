class Product < ActiveRecord::Base
	extend FriendlyId
	friendly_id :product_name, use: :slugged

	mount_uploader :image, ImageUploader

	searchkick

	has_many :reviews

	validates :product_brand, :product_name, :image, presence: true


end
