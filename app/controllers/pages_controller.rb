class PagesController < ApplicationController
	before_action :disable_nav, only: [:about, :thanks]
	before_action :disable_footer, only: [:about, :thanks]

	def login
	end

	def thanks
	end
end
