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

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      # TODO Implement flash messages
      # flash[:success] = "Rezept aktualisiert"
      # redirect_to recipe_path(@recipe)
      redirect_to recipes_path
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    Recipe.find(params[:id]).destroy
    # TODO Implement flash messages
      # flash[:success] = "Rezept gelöscht"
    redirect_to recipes_path, status: :see_other
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :author,
      :description, :photo)
  end
end
