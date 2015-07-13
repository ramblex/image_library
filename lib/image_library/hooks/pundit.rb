require 'pundit'

module ImageLibrary
  module Hooks
    class PunditAuthorization

      include ImageLibrary::Helpers::Controllers

      # See the +authorize_with+ config method for where initialization occurs
      def initialize(controller)
        @controller = controller
        @controller.extend ControllerExtension
      end

      def authorize(action, model_object = nil)
        raise Pundit::NotAuthorizedError unless authorized?(action, model_object)
      end

      def authorized?(action, model_object = nil)
        Pundit.policy(@controller.current_user_for_pundit, model_object).public_send(action.to_s + '?') if action
      end

      private

      module ControllerExtension
        def current_user_for_pundit
          # use image_library_current_user instead of default current_user so
          # it works with whatever current_user method is defined in
          # ImageLibrary.
          image_library_current_user
        end
      end
    end
  end
end

ImageLibrary::AUTHORIZATION_ADAPTERS[:pundit] = ImageLibrary::Hooks::PunditAuthorization
