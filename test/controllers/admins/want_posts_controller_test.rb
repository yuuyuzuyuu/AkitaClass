require 'test_helper'

class Admins::WantPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_want_posts_index_url
    assert_response :success
  end

end
