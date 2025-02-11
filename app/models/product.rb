class Product < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	has_many :photos, dependent: :destroy
	has_many :likes
	has_many :users, through: :likes
	has_many :liked_by, through: :likes, source: :user #rename user_id to liked_by in likes table for referencing from products
	belongs_to :category
	has_many :links
	has_many :uses, dependent: :destroy
	has_many :used_by, through: :uses, source: :user #rename user_id to used_by for referencing
	has_many :wants, dependent: :destroy
	has_many :wanted_by, through: :wants, source: :user
	has_many :product_posts
	has_many :posts, through: :product_posts
	has_many :currency_products
	has_many :currencies, through: :currency_products
	validates :name, :category, presence: true

	extend FriendlyId
	friendly_id :slug_candidates, use: :slugged

	def slug_candidates
		[
			[:name]
		]
	end

	def should_generate_new_friendly_id?
		name_changed?
	end

	mount_uploader :image, ImageUploader

	searchkick

	def self.popular
		Product.find(Product.joins(:uses).group('products.id').order("count(*) desc").limit(10).ids).shuffle
	end

	def self.most_wanted
		Product.find(Product.joins(:wants).group('products.id').order("count(*) desc").limit(3).ids)
	end

	def self.most_reviewed
		Product.find(Product.joins(:reviews).group('products.id').order("count(*) desc").ids)
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
		if self.rating.present? && !self.reviews.any?
			joint_rating = self.rating
		elsif !self.rating.present? && self.reviews.any?
			joint_rating = reviews.average(:rating).round(1)
		elsif self.rating.present? && self.reviews.any?
			joint_rating = ((self.rating + reviews.average(:rating))/2).round(1)
		elsif self.rating.blank?
			joint_rating = 0
		end
		joint_rating
	end

	def swatches
		posts.where("url like ?", "%" + "instagram" + "%")
	end

	def tutorials
		posts.where("url like ?", "%" + "youtube" + "%")
	end

end
