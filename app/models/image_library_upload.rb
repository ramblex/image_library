class ImageLibraryUpload < ActiveRecord::Base
  mount_uploader :image, ImageLibrary::ImageUploader
  validates_presence_of :image
  paginates_per 25
end
