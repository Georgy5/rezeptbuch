class Recipe < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :photo
  has_many :reviews, dependent: :destroy

  validates :title, presence: true
  validates :author, presence: true
  validates :description, presence: true

  broadcasts_to -> (recipe) { "recipes" }, inserts_by: :prepend

  def to_param
    "#{id}-#{latinize(title).parameterize}"
  end

  def latinize(string)
    string.unicode_normalize(:nfd).chars.select do |char|
      char.match(/\p{Latin}|\s/)
    end.join
  end
end
