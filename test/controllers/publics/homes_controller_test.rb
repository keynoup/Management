require "test_helper"

class Publics::HomesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get publics_homes_index_url
    assert_response :success
  end
end
