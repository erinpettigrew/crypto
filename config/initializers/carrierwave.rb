CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV["aws_access_key_id"],                    # required
    aws_secret_access_key: ENV["aws_secret_access_key"],                        # required
  }
  config.fog_directory  = ENV["fog_directory"]                     # required

module CarrierWave
	module MiniMagick
		def quality(percentage)
			manipulate! do |img|
				img.quality(percentage.to_s)
				img = yield(img) if block_given?
				img
			end
		end
	end
end

end

