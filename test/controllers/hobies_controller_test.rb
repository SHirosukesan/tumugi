require 'test_helper'

class HobiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hobies_index_url
    assert_response :success
  end

end
