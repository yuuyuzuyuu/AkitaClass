require 'test_helper'

class Admins::HelpPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_help_posts_index_url
    assert_response :success
  end

end
