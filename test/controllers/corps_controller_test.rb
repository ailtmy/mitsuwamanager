require 'test_helper'

class CorpsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get corps_index_url
    assert_response :success
  end

  test "should get show" do
    get corps_show_url
    assert_response :success
  end

  test "should get new" do
    get corps_new_url
    assert_response :success
  end

  test "should get edit" do
    get corps_edit_url
    assert_response :success
  end

end
