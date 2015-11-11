class User < ActiveRecord::Base
 
extend FriendlyId
	friendly_id :user_name, use: :slugged

def should_generate_new_friendly_id?
	user_name_changed? || slug.blank?
end

  def has_friendly_id_slug?
    slugs.where(slug: slug).exists?
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #each user can have many reviews and many photos, and destroy any reviews and photos that belong to a deleted user
  has_many :reviews, dependent: :destroy
  has_many :photos, dependent: :destroy

  validates :user_name, presence: true
end
