# encoding: utf-8
# ImageUploader is for admin-provided images of products, each Product has a field for one of these images

class ImageUploader < CarrierWave::Uploader::Base

  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  process :resize_to_fit => [500, 500]
  process :quality => 100
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :big_thumb do
    process :resize_to_fit => [1000,1000]
    process :quality => 95
  end

  version :med_thumb do
    process :resize_to_fit => [300, 1000]
    process :quality => 95
  end

  version :small_thumb do
    process :resize_to_fit => [150, 1000]
    process :quality => 95
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
   def extension_white_list
    %w(jpg jpeg gif png)
   end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end

end
