puts "GOT HERE"

ImageLibrary::ImageUploader.class_eval do
  version :thumb do
    process :resize_to_fit => [125, 125]
  end
end
