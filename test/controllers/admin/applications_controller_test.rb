require "test_helper"

class Admin::ApplicationsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_applications_show_url
    assert_response :success
  end
end
