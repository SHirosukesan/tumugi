require 'test_helper'

class MatchingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get matchings_index_url
    assert_response :success
  end

end
