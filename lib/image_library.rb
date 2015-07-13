require "carrierwave"
require "kaminari"
require "jquery-fileupload-rails"

module ImageLibrary
  module Hooks
    autoload :PunditAuthorization, 'image_library/hooks/pundit'
  end

  module Helpers
    autoload :Controllers, 'image_library/helpers/controllers'
  end

  DEFAULT_AUTHORIZE = Proc.new {}

  AUTHORIZATION_ADAPTERS = {}

  DEFAULT_CURRENT_USER = Proc.new do
    request.env["warden"].try(:user) || respond_to?(:current_user) && current_user
  end

  # Default way to set up ImageLibrary
  #
  # @example
  #   ImageLibrary.setup do |config|
  #     config.authorize_with :pundit
  #   end
  def self.setup
    yield self
  end

  def self.authorize_with(*args, &block)
    extension = args.shift

    if extension
      @authorize = Proc.new {
        @authorization_adapter = ImageLibrary::AUTHORIZATION_ADAPTERS[extension].new(*([self] + args).compact)
        @authorization_adapter
      }
    else
      @authorize = block if block
    end

    @authorize || DEFAULT_AUTHORIZE
  end

  def self.current_user_method(&block)
    @current_user = block if block
    @current_user || DEFAULT_CURRENT_USER
  end
end

require "image_library/engine"
