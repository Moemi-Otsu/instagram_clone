class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog


  process resize_to_fit: [600,400]

  version :thumb do
    process resize_to_fit: [100,100]
  end

  version :user do
    process resize_to_fit: [280,280]
  end
  

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end
