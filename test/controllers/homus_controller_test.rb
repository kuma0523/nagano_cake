require "test_helper"

class HomusControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get homus_top_url
    assert_response :success
  end

  test "should get about" do
    get homus_about_url
    assert_response :success
  end
end
