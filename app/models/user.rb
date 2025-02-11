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
  has_many :posts

  validates :user_name, presence: true, allow_blank: false
  validates_uniqueness_of :user_name, :case_sensitive => false

  devise :omniauthable, :omniauth_providers => [:facebook]

  extend FriendlyId
  friendly_id :user_name, use: [:slugged, :finders]

  # after_create :send_notification

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.user_name = auth.info.name   # assuming the user model has a name
      if !user.avatar.present?
        Avatar.create(user: user)
        user.avatar.remote_image_url = auth.info.image.gsub('http://','https://') << "?type=large"
        user.save
        user.avatar.save
      end
    end
  end

  def first_name
    user_name.split('').each_with_index do |letter, index|
      if letter == " "
        return user_name[0...index]
      end
    end
  end

  def self.new_with_session(params, session)
  super.tap do |user|
    if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
      user.email = data["email"] if user.email.blank?
    end
  end
end

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
    avatar.nil? ? "https://s3.amazonaws.com/productbase/hearts/black-heart.jpeg" : avatar.image.med_thumb
  end
end
