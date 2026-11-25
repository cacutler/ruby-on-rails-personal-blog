require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    post sign_in_url, params: { email: users(:one).email, password: "password" }
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should create post" do
    assert_difference("Post.count") do
      post posts_url, params: { post: { body: @post.body, title: @post.title } }
    end

    assert_redirected_to post_url(Post.last)
    assert_equal users(:one), Post.last.user
  end

  test "should show post" do
    get post_url(@post)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_url(@post)
    assert_response :success
  end

  test "should update post" do
    patch post_url(@post), params: { post: { body: @post.body, title: @post.title } }
    assert_redirected_to post_url(@post)
  end

  test "should destroy post" do
    assert_difference("Post.count", -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end

  test "anonymous visitors cannot create posts" do
    delete sign_out_url

    assert_no_difference("Post.count") do
      post posts_url, params: { post: { body: "Body", title: "Title" } }
    end

    assert_redirected_to sign_in_url
  end

  test "users cannot update or destroy another user's post" do
    post sign_in_url, params: { email: users(:two).email, password: "password" }

    patch post_url(@post), params: { post: { title: "Changed title" } }
    assert_redirected_to post_url(@post)
    assert_not_equal "Changed title", @post.reload.title

    assert_no_difference("Post.count") do
      delete post_url(@post)
    end
  end
end
