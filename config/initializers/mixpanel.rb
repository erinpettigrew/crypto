require 'mixpanel-ruby'

$tracker = Mixpanel::Tracker.new(ENV['MIXPANEL_TOKEN'])

# f Rails.env.development?
	#silence local SSL errors
	Mixpanel.config_http do |http|
		http.verify_mode = OpenSSL::SSL::VERIFY_NONE
	end
# end

