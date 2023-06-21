class Recipe < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :photo
  has_many :reviews, dependent: :destroy
  
  validates :title, presence: true
  validates :author, presence: true
  validates :description, presence: true

  broadcasts_to -> (recipe) { "recipes" }, inserts_by: :prepend

  def to_param
    "#{id}-#{title.parameterize}"
  end

  def recipe_rating
    rating = self.reviews.average(:rating).to_i()
  end
end
