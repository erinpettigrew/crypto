class Product < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	has_many :photos, dependent: :destroy
	has_many :likes
	has_many :users, through: :likes
	has_many :liked_by, through: :likes, source: :user #rename user_id to liked_by in likes table for referencing from products
	belongs_to :category
	has_one :ingredient
	has_many :links
	has_many :uses, dependent: :destroy
	has_many :used_by, through: :uses, source: :user #rename user_id to used_by for referencing
	has_many :wants, dependent: :destroy
	has_many :wanted_by, through: :wants, source: :user
	has_many :look_products
	has_many :looks, through: :look_products
	has_many :product_posts
	has_many :posts, through: :product_posts
	validates :product_brand, :product_name, :image, :category, presence: true

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

	def self.brands
		Product.all.pluck(:product_brand).uniq.sort_by(&:downcase)
	end

	def self.ingredients
		ingredients = Product.all.pluck(:ingredients).join
		ingredients = ingredients.gsub("\n", "").gsub("\r", "")
		ingredients = ingredients.split(", ")
		ingredients.select { |ing| !ing.nil? }
	end

	def self.popular
		Product.find(Product.joins(:uses).group('products.id').order("count(*) desc").limit(3).ids).shuffle
	end

	def self.most_wanted
		Product.find(Product.joins(:wants).group('products.id').order("count(*) desc").limit(3).ids)
	end

	def self.best
		best = []
		Product.all.each do |product|
			if product.average_rating == 5
				best << product
			end
		end
		best.take(3).shuffle
	end

	def recent_reviews
		reviews.includes(:user => :avatar).order(created_at: :desc)
	end

	def recent_uses
		uses.order(created_at: :desc)
	end

	def recent_wants
		wants.order(created_at: :desc)
	end

	def average_rating
		reviews.blank? ? 0 : reviews.average(:rating).round(2)
	end

end
