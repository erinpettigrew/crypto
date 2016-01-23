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

	has_many :reviews, dependent: :destroy
	has_many :photos, dependent: :destroy
	has_many :likes
	has_many :users, through: :likes
	has_many :liked_by, through: :likes, source: :user #rename user_id to liked_by in likes table for referencing from products
	belongs_to :category
	has_one :ingredient
	has_many :links
	has_many :user
	has_many :used_by, through: :uses, source: :user #rename user_id to used_by for referencing

	validates :product_brand, :product_name, :image, :category, presence: true


end
