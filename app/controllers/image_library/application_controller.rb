module ImageLibrary
  class ApplicationController < ActionController::Base
    before_filter :image_library_authorize!
  end
end
