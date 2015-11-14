class AdminMailer < ApplicationMailer
	default from: "no-reply@gmail.com"
	default to: "lookloveco@gmail.com"

	def new_user(user)
		@user = user
		mail(subject: "New User: #{user.email}, #{user.user_name}")
	end
end
