require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  def setup
    @user = User.new(first_name: 'Example', last_name: 'User', 
                      email: 'user@example.com', password: "foobar", 
                      password_confirmation: "foobar")
    @recipe  = Recipe.new(title: "Sadza", author: @user.name,
                          description: "Vermische das Maismehl mit Wasser.")
    @review = Review.new(rating: 3)
    @review.recipe = @recipe
    @review.user = @user
  end

  test "should be valid" do
    assert @review.valid?
  end

  test "rating should be present" do
    @review.rating = nil
    assert_not @review.valid?
  end

  test "rating should be in range 1-5" do
    @review.rating = 6
    assert_not @review.valid?
  end
end
