require 'test_helper'

class EstatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get estates_index_url
    assert_response :success
  end

end
