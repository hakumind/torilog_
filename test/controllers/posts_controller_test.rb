require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get select" do
    get posts_select_url
    assert_response :success
  end

end
