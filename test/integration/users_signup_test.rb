require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup credentials" do
    assert_no_difference 'User.count' do
      post users_path,
      params: { user: { first_name: "",
                        last_name: "",
                        email: "user@invalid",
                        password: "foo",
                        password_confirmation: "bar" } }
    end
    assert_response :unprocessable_entity
    assert_template 'users/new'
  end
  
  test "should throw error messages" do
    assert_no_difference 'User.count' do
      post users_path, 
        params: { user: { first_name: "",
                          last_name: "",
                          email: "test@example.org",
                          password: "password",
                          password_confirmation: "foobar" } }
    end
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "valid signup credentials" do
    assert_difference 'User.count', 1 do
      post users_path,
      params: { user: { first_name: "Test",
                        last_name: "User",
                        email: "user@example.com",
                        password: "password",
                        password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'recipes/index'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_not flash.empty?
    assert is_logged_in?
  end
end
