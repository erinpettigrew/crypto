class User < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :likes
  # has_many :products, through: :likes
  has_many :liked_products, through: :likes, source: :product #rename product_id to liked_products in likes table for purpose of referencing from users
  has_one :avatar
  has_many :uses, dependent: :destroy
  has_many :used_products, through: :uses, source: :product #rename product_id to used_products in uses table for purpose of referencing from users
  has_many :wants, dependent: :destroy
  has_many :wanted_products, through: :wants, source: :product
  has_one :profile
  has_one :skin_type, through: :profiles, source: :skin_type
  has_many :posts
  validates :user_name, presence: true
  validates_uniqueness_of :user_name, :case_sensitive => false

  extend FriendlyId
  friendly_id :user_name, use: :slugged

  # after_create :send_notification

  def send_notification
    AdminMailer.new_user(self).deliver_now
  end

  def should_generate_new_friendly_id?
    user_name_changed? || slug.blank?
  end

  def has_friendly_id_slug?
    slugs.where(slug: slug).exists?
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  def pic
    avatar.nil? ? "https://s3.amazonaws.com/productbase/hearts/black-heart.jpeg" : avatar.image
  end
end
