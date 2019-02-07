require 'test_helper'

class TelsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get tels_new_url
    assert_response :success
  end

  test "should get edit" do
    get tels_edit_url
    assert_response :success
  end

end
