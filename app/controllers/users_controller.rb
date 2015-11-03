class UsersController < ApplicationController

# display reviews by the current user on their profile page in reverse chron
def show
	@current_user_reviews = Review.where(user: current_user).order("created_at DESC")
end
	
end
