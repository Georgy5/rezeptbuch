class Api::V1::RecipesController < ActionController::API
  def index
    @recipes = Recipe.all.order("created_at DESC")
    render json: @recipes
  end

  def show
    @recipe = Recipe.find(params[:id])
    render json: @recipe.to_json(
      :include => {
        :reviews => {only: [:rating, :user_id]}
      }
    )
  end
end
