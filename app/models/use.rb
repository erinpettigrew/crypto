class Use < ActiveRecord::Base
	belongs_to :product, counter_cache: :uses_count
	belongs_to :user

	validates :user_id, uniqueness: {
		scope: [:product_id],
		message: "Oops, you are already using this product"
	}
end
