require "test_helper"

class Admin::MenusControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_menus_show_url
    assert_response :success
  end
end
