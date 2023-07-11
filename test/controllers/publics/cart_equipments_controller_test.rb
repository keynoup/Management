require "test_helper"

class Publics::CartEquipmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get publics_cart_equipments_index_url
    assert_response :success
  end
end
