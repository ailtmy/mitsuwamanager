require 'test_helper'

class IdentifiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get identifies_index_url
    assert_response :success
  end

  test "should get show" do
    get identifies_show_url
    assert_response :success
  end

  test "should get new" do
    get identifies_new_url
    assert_response :success
  end

  test "should get edit" do
    get identifies_edit_url
    assert_response :success
  end

end
