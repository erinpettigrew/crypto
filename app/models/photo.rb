class Photo < ActiveRecord::Base

	after_create :send_notification

	def send_notification
		AdminMailer.new_photo(self.product, self.user.user_name).deliver_now
	end

	belongs_to :user
	belongs_to :product,
		touch: true

	mount_uploader :product_photo, PhotoUploader
end
