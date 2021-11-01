require 'test_helper'

class StaticControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get static_index_url
    assert_response :success
  end

  test "should get index_in_french" do
    get static_index_in_french_url
    assert_response :success
  end

end
