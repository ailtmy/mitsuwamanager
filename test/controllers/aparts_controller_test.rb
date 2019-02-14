require 'test_helper'

class ApartsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get aparts_index_url
    assert_response :success
  end

  test "should get show" do
    get aparts_show_url
    assert_response :success
  end

  test "should get new" do
    get aparts_new_url
    assert_response :success
  end

  test "should get edit" do
    get aparts_edit_url
    assert_response :success
  end

end
