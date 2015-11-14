class AdminMailer < ApplicationMailer
	default from: "no-reply@gmail.com"
	default to: "lookloveco@gmail.com"

	def new_user(user)
		@user = user
		mail(subject: "New User: #{user.email}")
	end

	def new_review(product, user)
		@product = product
		@user = user
		mail(subject: "New Review from #{user}")
	end

	def new_photo(product, user)
		@product = product
		@user = user
		mail(subject: "New Photo from #{user}")
	end
end
