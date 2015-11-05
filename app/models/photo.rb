class Photo < ActiveRecord::Base
	belongs_to :user
	belongs_to :product

	mount_uploader :product_photo, PhotoUploader
end
