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
end
