module RecipesHelper
  # TODO Use Rails pluralisation instead
  def pluralize_reviews_de(rating)
    if rating == 1
      "#{rating}e Bewertung"
    else
      "#{rating} Bewertungen"
    end
  end
end
