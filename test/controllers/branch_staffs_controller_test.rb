require 'test_helper'

class BranchStaffsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get branch_staffs_index_url
    assert_response :success
  end

  test "should get show" do
    get branch_staffs_show_url
    assert_response :success
  end

  test "should get new" do
    get branch_staffs_new_url
    assert_response :success
  end

  test "should get edit" do
    get branch_staffs_edit_url
    assert_response :success
  end

end
