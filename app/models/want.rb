class Want < ActiveRecord::Base
	
	belongs_to :product
	belongs_to :user

	validates :user_id, uniqueness: {
		scope: [:product_id],
		message: "Oops, you already want this product"
		}

end
