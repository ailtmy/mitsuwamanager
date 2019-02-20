require 'test_helper'

class InheritsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get inherits_index_url
    assert_response :success
  end

  test "should get show" do
    get inherits_show_url
    assert_response :success
  end

  test "should get new" do
    get inherits_new_url
    assert_response :success
  end

  test "should get edit" do
    get inherits_edit_url
    assert_response :success
  end

end
