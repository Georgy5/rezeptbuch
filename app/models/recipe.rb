class Recipe < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  
  validates :title, presence: true
  validates :author, presence: true
  validates :description, presence: true
end
