require "test_helper"

class Public::UserApplicationDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get public_user_application_details_update_url
    assert_response :success
  end
end
