class Api::V1::RecipesController < ActionController::API
  def index
    @recipes = Recipe.all.order("created_at DESC")
    render json: @recipes
  end
end
