class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.order("created_at DESC")
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  private

  def recipe_params
    params.requre(:recipe).permit(:title, :author,
      :description, :photo)
  end
end
