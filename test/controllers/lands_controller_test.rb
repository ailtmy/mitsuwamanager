require 'test_helper'

class LandsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lands_index_url
    assert_response :success
  end

  test "should get show" do
    get lands_show_url
    assert_response :success
  end

  test "should get new" do
    get lands_new_url
    assert_response :success
  end

  test "should get edit" do
    get lands_edit_url
    assert_response :success
  end

end
