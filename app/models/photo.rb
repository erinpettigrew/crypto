class Photo < ActiveRecord::Base
	belongs_to :user
	belongs_to :product,
		touch: true

	mount_uploader :product_photo, PhotoUploader
end
