require 'test_helper'

class NflControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get nfl_index_url
    assert_response :success
  end

end
