class Like < ActiveRecord::Base
	belongs_to :product
	belongs_to :user

	validates :user_id, uniqueness: {
		scope: [:product_id],
		message: "Oops, you can only like this product once"
	}
end
