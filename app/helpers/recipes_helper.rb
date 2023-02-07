module RecipesHelper
  def recipe_rating(recipe)
    reviews = recipe.reviews
    rating = reviews.average(:rating).to_i()
  end

  def pluralize_reviews_de(rating)
    if rating == 1
      "#{rating}e Bewertung"
    else
      "#{rating} Bewertungen"
    end
  end
end
