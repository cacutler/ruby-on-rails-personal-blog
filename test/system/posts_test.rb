require "application_system_test_case"

class PostsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
    visit sign_in_path
    fill_in "Email", with: users(:one).email
    fill_in "Password", with: "password"
    click_button "Sign in"
    assert_text "Signed in as #{users(:one).email}"
  end

  test "visiting the index" do
    visit posts_path
    assert_selector "h1", text: "My Personal Blog"
  end

  test "should create post" do
    visit posts_path
    click_on "New post"

    fill_in "Body", with: @post.body
    fill_in "Title", with: @post.title
    click_button "Create Post"

    using_wait_time(5) { assert_text "Post was successfully created" }
    click_on "Back"
  end

  test "should update Post" do
    visit post_path(@post)
    click_on "Edit this post", match: :first

    fill_in "Body", with: @post.body
    fill_in "Title", with: @post.title
    click_on "Update Post"

    assert_text "Post was successfully updated"
    click_on "Back"
  end

  test "should destroy Post" do
    visit post_path(@post)
    click_on "Destroy this post", match: :first

    assert_text "Post was successfully destroyed"
  end
end
