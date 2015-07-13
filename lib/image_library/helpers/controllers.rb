module ImageLibrary
  module Helpers
    module Controllers
      extend ActiveSupport::Concern

      protected

        def image_library_current_user
          instance_eval &ImageLibrary.current_user_method
        end

        def image_library_authorize!
          instance_eval &ImageLibrary.authorize_with
        end
    end
  end
end
