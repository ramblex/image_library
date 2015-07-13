module ImageLibrary
  class UploadsController < ApplicationController
    def index
      @authorization_adapter.try(:authorize, :index, @uploads)
      @uploads = ImageLibraryUpload.page(params[:image_library_page])
      if params[:query].present?
        @uploads = @uploads.where('lower(image) like ?', "%#{params[:query].downcase}%")
      end
    end

    def create
      @upload = ImageLibraryUpload.create(image: params[:upload][:files])
      @authorization_adapter.try(:authorize, :create, @upload)
      render partial: @upload
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
