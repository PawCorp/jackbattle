require "test_helper"

class StaticContentControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_content_home_url
    assert_response :success
  end
end
