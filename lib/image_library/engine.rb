module ImageLibrary
  class Engine < ::Rails::Engine
    isolate_namespace ImageLibrary

    initializer "image_library.helpers" do
      ActiveSupport.on_load :action_controller do
        ActionController::Base.send :include, ImageLibrary::Helpers::Controllers
      end
    end

    initializer "image_library.hooks" do
      if Object.const_defined?("Pundit")
        require "image_library/hooks/pundit"
      end
    end
  end
end
