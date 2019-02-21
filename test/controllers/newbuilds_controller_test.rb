require 'test_helper'

class NewbuildsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get newbuilds_index_url
    assert_response :success
  end

  test "should get show" do
    get newbuilds_show_url
    assert_response :success
  end

  test "should get new" do
    get newbuilds_new_url
    assert_response :success
  end

  test "should get edit" do
    get newbuilds_edit_url
    assert_response :success
  end

end
