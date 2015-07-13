FactoryGirl.define do
  factory :upload, class: ImageLibrary::Upload do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, '..', 'fixtures', 'test.jpg')) }
  end
end
