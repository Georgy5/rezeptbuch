require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  def setup
    @recipe  = Recipe.new(title: "Sadza", author: "Karl",
                          description: "Vermische das Maismehl mit Wasser.")
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
