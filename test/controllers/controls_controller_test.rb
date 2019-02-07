require 'test_helper'

class ControlsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get controls_index_url
    assert_response :success
  end

  test "should get show" do
    get controls_show_url
    assert_response :success
  end

  test "should get new" do
    get controls_new_url
    assert_response :success
  end

  test "should get edit" do
    get controls_edit_url
    assert_response :success
  end

end
