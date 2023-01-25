class ReviewsController < ApplicationController
  before_action :logged_in_user, only: [:new]
  
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @review = Review.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @review = @recipe.reviews.new(review_params)
    @review.user = current_user
    if @review.save!
      redirect_to recipe_path(@recipe)
    else
      flash[:alert] = "Bewertung konnte nicht abgegeben werden."
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :user_id, :recipe_id)
  end
end
