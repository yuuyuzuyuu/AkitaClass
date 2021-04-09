require 'test_helper'

class Admins::MembersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_members_index_url
    assert_response :success
  end

end
