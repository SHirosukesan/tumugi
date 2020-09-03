require 'test_helper'

class MyPublishersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_publishers_index_url
    assert_response :success
  end

end
