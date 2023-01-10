require "test_helper"

class RecipesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get recipes_index_url
    assert_response :success
  end

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "Rezeptbuch"
  end
end
