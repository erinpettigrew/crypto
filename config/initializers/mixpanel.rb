require 'mixpanel-ruby'

#if Rails.env == "development"
#Development tracking token
@tracker = Mixpanel::Tracker.new('a0443529993e5be524d60dae5e645abf')



#if Rails.env == "production"
#Production tracking token
#$mixpanel = Mixpanel::Tracker.new(ENV['MIXPANEL_PROD_TOKEN'])


