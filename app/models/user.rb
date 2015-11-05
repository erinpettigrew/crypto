class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #each user can have many reviews and many photos, and destroy any reviews and photos that belong to a deleted user
  has_many :reviews, dependent: :destroy
  has_many :photos, dependent: :destroy

  validates :user_name, presence: true
end
