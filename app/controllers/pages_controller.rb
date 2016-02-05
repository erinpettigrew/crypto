class PagesController < ApplicationController
	before_action :disable_nav, only: [:about, :thanks]
	before_action :disable_footer, only: [:about, :thanks]

 def about
 # 	@page_title = "looklove"
 # 	@page_description = "looklove, a new beauty community"
 # 	@page_keywords = "looklove reviews beauty skincare makeup products recommendations best products"
 end

 def thanks
 end

 # def contact
 # 	  	@page_title = "looklove - contact"
 #		@page_description = "Contact looklove, the community for reviews of Asian skincare and beauty products"
 #		@page_keywords = "looklove contact address email"
 # end
end
