class Category < ActiveRecord::Base
	belongs_to :theme
	has_many :products

	extend FriendlyId
	friendly_id :name, use: :slugged
end
