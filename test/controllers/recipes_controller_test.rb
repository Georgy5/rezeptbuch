require "test_helper"

class RecipesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get recipes_path
    assert_response :success
  end

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "Rezeptbuch"
    assert_select "h1", /^Willkommen/
  end

  test "should get new" do
    log_in_as(users(:malory))
    get new_recipe_path recipes(:one)
    assert_response :success
  end

  test "should create recipe" do
    log_in_as(users(:malory))
    assert_difference "Recipe.count" do
      post recipes_url, params: { recipe: { title: "A recipe",
        author: "Test Doe", description: "Testing flash messages" } }
    end
    assert_redirected_to recipe_path(Recipe.last)
    assert_equal "Neues Rezept hinzugefügt", flash[:success]
  end

  test "should show recipe" do
    recipe = recipes(:one)
    get recipe_url(recipe)
    assert_response :success
  end
end
