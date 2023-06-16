class Recipe < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :photo
  has_many :reviews, dependent: :destroy
  
  validates :title, presence: true
  validates :author, presence: true
  validates :description, presence: true

  scope :ordered, -> { order(created_at: :desc) }

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
