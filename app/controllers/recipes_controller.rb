class RecipesController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :destroy]

  def index
    @recipes = Recipe.all.order("created_at DESC")
  end

  def show
    @recipe = get_recipe(params[:id])
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
    @recipe = get_recipe(params[:id])
  end

  def update
    @recipe = get_recipe(params[:id])
    if @recipe.update(recipe_params)
      flash[:success] = "Rezept aktualisiert"
      redirect_to recipe_path(@recipe)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    get_recipe(params[:id]).destroy
    flash[:danger] = "Rezept gelöscht"
    redirect_to recipes_path, status: :see_other
  end

  private

  def get_recipe(recipe_id)
    Recipe.find(recipe_id)
  end

  def recipe_params
    params.require(:recipe).permit(:title, :author,
      :description, :photo, :user_id)
  end
end
