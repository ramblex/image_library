ImageLibrary::ImageUploader.class_eval do
  version :thumb do
    process :resize_to_fit => [500, 500]
  end
end

ImageLibrary.setup do |config|
  config.authorize_with :pundit
end
