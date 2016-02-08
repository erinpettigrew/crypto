class Category < ActiveRecord::Base

	belongs_to :theme

extend FriendlyId
	friendly_id :name, use: :slugged

		has_many :products

end
