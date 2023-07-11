require "test_helper"

class Admin::UserApplicationDetailsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get admin_user_application_details_update_url
    assert_response :success
  end
end
