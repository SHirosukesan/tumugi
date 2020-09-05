require 'test_helper'

class AssessmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get assessments_index_url
    assert_response :success
  end

end
