require "test_helper"

class RegistrationsControllerTest < ActionDispatch::IntegrationTest
  test "registration creates an account and signs the user in" do
    assert_difference("User.count") do
      post sign_up_url, params: {
        user: {
          email: "  Reader@Example.com ",
          password: "password123",
          password_confirmation: "password123"
        }
      }
    end

    assert_redirected_to root_url
    follow_redirect!
    assert_select "header", text: /reader@example.com/
  end

  test "registration rejects duplicate email addresses regardless of case" do
    assert_no_difference("User.count") do
      post sign_up_url, params: {
        user: {
          email: users(:one).email.upcase,
          password: "password123",
          password_confirmation: "password123"
        }
      }
    end

    assert_response :unprocessable_entity
  end
end
