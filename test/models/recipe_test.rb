require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  def setup
    @user = User.new(first_name: 'Example', last_name: 'User', 
                      email: 'user@example.com', password: "foobar", 
                      password_confirmation: "foobar")
    @recipe  = Recipe.new(title: "Sadza", author: @user.name,
                          description: "Vermische das Maismehl mit Wasser.")
    @recipe.user = @user
  end

  test "should be valid" do
    assert @recipe.valid?
  end

  test "title should be present" do
    @recipe.title = " "
    assert_not @recipe.valid?
  end

  test "author should be present" do
    @recipe.author = " "
    assert_not @recipe.valid?
  end

  test "description should be present" do
    @recipe.description = " "
    assert_not @recipe.valid?
  end
end
