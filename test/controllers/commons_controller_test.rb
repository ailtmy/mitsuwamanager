require 'test_helper'

class CommonsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get commons_index_url
    assert_response :success
  end

  test "should get show" do
    get commons_show_url
    assert_response :success
  end

  test "should get new" do
    get commons_new_url
    assert_response :success
  end

  test "should get edit" do
    get commons_edit_url
    assert_response :success
  end

end
