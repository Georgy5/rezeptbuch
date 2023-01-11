class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.order("created_at DESC")
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      # TODO Implement flash messages
      # flash[:info] = "Neues Rezept hinzugefügt"
      redirect_to root_url
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :author,
      :description, :photo)
  end
end
