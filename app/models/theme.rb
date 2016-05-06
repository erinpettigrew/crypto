class Theme < ActiveRecord::Base

	has_many :categories
	has_many :products, through: :categories

  extend FriendlyId
  friendly_id :name, use: :slugged

end
