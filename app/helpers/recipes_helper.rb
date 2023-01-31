module RecipesHelper
  def recipe_rating(recipe)
    reviews = recipe.reviews
    rating = reviews.average(:rating).to_i()
  end
end
