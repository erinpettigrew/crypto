class Avatar < ActiveRecord::Base
	belongs_to :user

	validates :user_id, uniqueness: {
		scope: [:image],
		message: "Oops, you can only have one avatar"
	}

	mount_uploader :image, AvatarUploader
end
