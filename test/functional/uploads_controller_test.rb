require 'test_helper'

module ImageLibrary
  class UploadsControllerTest < ActionController::TestCase
    setup do
      @routes = Engine.routes
    end

    def test_index
      xhr :get, :index
      assert_response :success
      assert_not_nil assigns(:uploads)
    end

    def test_index_with_query
      exclude_upload = create(:upload, image: fixture_file_upload('another.jpg'))
      included_upload = create(:upload)

      xhr :get, :index, query: "test"
      assert_response :success
      assert_includes assigns(:uploads), included_upload
      assert_not_includes assigns(:uploads), exclude_upload
    end

    def test_create
      assert_difference('Upload.count') do
        xhr :post, :create, upload: {
          files: fixture_file_upload('test.jpg')
        }
      end
      assert_response :success
    end

    def test_destroy
      upload = create(:upload)

      assert_difference('Upload.count', -1) do
        xhr :delete, :destroy, id: upload
      end
      assert_response :success
    end
  end
end
