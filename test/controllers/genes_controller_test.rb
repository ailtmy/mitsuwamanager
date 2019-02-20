require 'test_helper'

class GenesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get genes_index_url
    assert_response :success
  end

  test "should get show" do
    get genes_show_url
    assert_response :success
  end

  test "should get new" do
    get genes_new_url
    assert_response :success
  end

  test "should get edit" do
    get genes_edit_url
    assert_response :success
  end

end
