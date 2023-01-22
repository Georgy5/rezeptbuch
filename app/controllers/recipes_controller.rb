class RecipesController < ApplicationController
  before_action :logged_in_user, only: [:create, :edit, :destroy]
  before_action :correct_user,   only: :destroy

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
      flash[:success] = "Neues Rezept hinzugefügt"
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

  def correct_user
    @recipe = current_user.recipes.find_by(id: params[:id])
    redirect_to(root_url, status: :see_other) if @recipe.nil?
  end
end
