class Review < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :rating, presence: true, inclusion: { in: [1, 2, 3, 4, 5] }
  validates :user_id, :uniqueness => { :scope => :recipe_id,
    :message => "Nur eine Bewertung per Rezept" }
end
