require "test_helper"

class AuthControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get auth_index_url
    assert_response :success
  end

  test "should get signup" do
    get auth_signup_url
    assert_response :success
  end

  test "should get home" do
    get auth_home_url
    assert_response :success
  end
end
