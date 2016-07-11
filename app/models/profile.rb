class Profile < ActiveRecord::Base
	belongs_to :user
	has_one :skin_type

	accepts_nested_attributes_for :user

	validates :user_id, uniqueness: {
		scope: [:user_id],
		message: "Oops, you can only have one profile"
	}
end
