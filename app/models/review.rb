class Review < ActiveRecord::Base

after_create :send_notification

def send_notification
	AdminMailer.new_review(self.product, self.user.user_name).deliver
end

	belongs_to :user
	belongs_to :product,
		touch: true

	validates :rating, :comment, presence: true
	validates :rating, numericality: {
		only_integer: true,
		greater_than_or_equal_to: 1,
		less_than_or_equal_to: 5,
		message: "can only be a whole number between 1 and 5"
	}
end
