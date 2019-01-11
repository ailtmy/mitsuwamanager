require 'test_helper'

class CasefilesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get casefiles_index_url
    assert_response :success
  end

end
