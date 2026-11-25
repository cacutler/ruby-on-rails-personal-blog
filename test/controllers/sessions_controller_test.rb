require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "valid credentials sign the user in" do
    post sign_in_url, params: { email: users(:one).email.upcase, password: "password" }

    assert_redirected_to root_url
    follow_redirect!
    assert_select "header", text: /owner@example.com/
  end

  test "invalid credentials do not sign the user in" do
    post sign_in_url, params: { email: users(:one).email, password: "incorrect" }

    assert_response :unprocessable_entity
    assert_select "p", text: "Invalid email or password."
  end
end
