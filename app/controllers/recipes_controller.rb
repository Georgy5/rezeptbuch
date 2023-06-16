class RecipesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :destroy]

  def index
    @recipes = Recipe.all.ordered
  end

  def show
    @recipe = Recipe.find(params[:id])
    @rating = helpers.recipe_rating @recipe
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user if current_user
    if @recipe.save
      flash[:success] = "Neues Rezept hinzugefügt"
      redirect_to recipe_path(@recipe)
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
      flash[:success] = "Rezept aktualisiert"
      redirect_to recipe_path(@recipe)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    Recipe.find(params[:id]).destroy
    flash[:danger] = "Rezept gelöscht"
    redirect_to recipes_path, status: :see_other
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :author,
      :description, :photo, :user_id)
  end
end
