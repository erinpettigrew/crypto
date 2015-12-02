class Product < ActiveRecord::Base
	extend FriendlyId
	friendly_id :slug_candidates, use: :slugged

	def slug_candidates
		[
			[:product_brand, :product_name]

		]
	end

	def should_generate_new_friendly_id?
		product_brand_changed? || product_name_changed?
	end


	mount_uploader :image, ImageUploader

	searchkick

	has_many :reviews, :dependent => :destroy
	has_many :photos, :dependent => :destroy
	belongs_to :category

	validates :product_brand, :product_name, :image, :category, presence: true


end
