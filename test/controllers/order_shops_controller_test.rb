require 'test_helper'

class OrderShopsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get order_shops_index_url
    assert_response :success
  end

  test "should get show" do
    get order_shops_show_url
    assert_response :success
  end

end
