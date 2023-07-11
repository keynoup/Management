require "test_helper"

class Publics::EquipmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get publics_equipments_show_url
    assert_response :success
  end
end
