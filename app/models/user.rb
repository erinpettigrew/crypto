class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #each user can have many reviews, and destroy any reviews that belong to a deleted user
  has_many :reviews, dependent: :destroy
end
