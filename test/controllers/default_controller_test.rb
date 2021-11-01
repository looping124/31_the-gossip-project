require 'test_helper'

class DefaultControllerTest < ActionDispatch::IntegrationTest
  test "should get team" do
    get default_team_url
    assert_response :success
  end

  test "should get contact" do
    get default_contact_url
    assert_response :success
  end

end
