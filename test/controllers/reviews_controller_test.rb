require "test_helper"

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @recipe = recipes(:one)
  end

  test "should get new" do
    log_in_as(users(:malory))
    get new_recipe_review_path @recipe
    assert_response :success
  end
end
