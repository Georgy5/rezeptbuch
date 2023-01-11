class Recipe < ApplicationRecord
  has_one_attached :photo
  
  validates :title, presence: true
  validates :author, presence: true
  validates :description, presence: true
end
