require 'test_helper'

class LandfsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get landfs_index_url
    assert_response :success
  end

  test "should get show" do
    get landfs_show_url
    assert_response :success
  end

  test "should get new" do
    get landfs_new_url
    assert_response :success
  end

  test "should get edit" do
    get landfs_edit_url
    assert_response :success
  end

end
