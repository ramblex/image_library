module ImageLibrary
  class UploadsController < ApplicationController
    layout 'application'

    def index
      @authorization_adapter.try(:authorize, :index, ImageLibraryUpload.new)
      @uploads = ImageLibraryUpload.page(params[:image_library_page])
      if params[:query].present?
        @uploads = @uploads.where('lower(image) like ?', "%#{params[:query].downcase}%")
      end
    end

    def create
      @upload = ImageLibraryUpload.create(image: params[:upload][:files])
      @authorization_adapter.try(:authorize, :create, @upload)
      render partial: "image_library/uploads/upload", object: @upload
    end

    def destroy
      @upload = ImageLibraryUpload.find(params[:id])
      @authorization_adapter.try(:authorize, :destroy, @upload)
      @upload.destroy
    end

    def permitted_params
      params.require(:upload).permit(:image)
    end
  end
end
