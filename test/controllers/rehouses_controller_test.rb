require 'test_helper'

class RehousesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rehouses_index_url
    assert_response :success
  end

  test "should get show" do
    get rehouses_show_url
    assert_response :success
  end

  test "should get new" do
    get rehouses_new_url
    assert_response :success
  end

  test "should get edit" do
    get rehouses_edit_url
    assert_response :success
  end

end
