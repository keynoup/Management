require "test_helper"

class Public::ApplicationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_applications_new_url
    assert_response :success
  end

  test "should get index" do
    get public_applications_index_url
    assert_response :success
  end

  test "should get show" do
    get public_applications_show_url
    assert_response :success
  end

  test "should get use_list" do
    get public_applications_use_list_url
    assert_response :success
  end

  test "should get return_input" do
    get public_applications_return_input_url
    assert_response :success
  end
end
