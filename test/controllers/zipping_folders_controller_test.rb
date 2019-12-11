require 'test_helper'

class ZippingFoldersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get zipping_folders_new_url
    assert_response :success
  end

end
