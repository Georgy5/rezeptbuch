require "application_system_test_case"

class RecipesTest < ApplicationSystemTestCase 
  def log_in_as(user, password: 'password')
    post login_path, params: { session: { email: user.email,
                                          password: password } }
  end
  
  setup do
    log_in_as(users(:malory))
    @recipe = Recipe.ordered.first
  end

  test "Creating a new recipe" do
    visit recipes_path
    assert_selector "h1", text: "Willkommen bei Ihrem Rezeptbuch"

    click_on "Neues Gericht hinzufügen"
    fill_in "Titel", with: "Capybara recipe"

    assert_selector "h1", text: "Rezept hinzufügen"
    click_on "Rezept hinzufügen"

    assert_selector "h1", text: "recipes"
    assert_text "Willkommen bei Ihrem Rezeptbuch"
  end

  test "Showing a recipe" do
    visit recipes_path
    click_link @recipe.title
    
    assert_selector "h1", text: @recipe.title
  end

  test "Updating a recipe" do
    visit recipes_path
    assert_selector "h1", text: "Willkommen bei Ihrem Rezeptbuch"

    click_on "Rezept anpassen", match: :first
    fill_in "Titel", with: "Updated recipe"

    assert_selector "h1", text: "Rezept anpassen"
    click_on "Änderungen speichern"

    assert_selector "h1", text: "Willkommen bei Ihrem Rezeptbuch"
    assert_text "Updated recipe"
  end

  test "Deleting a recipe" do
    visit recipes_path
    assert_text @recipe.title

    click_on "Rezept löschen", match: :first
    assert_no_text @recipe.title
  end
end
