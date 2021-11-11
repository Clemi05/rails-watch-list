class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 6 }
  validates_associated %i[movie list], uniqueness: true
  validates :list_id, uniqueness: { scope: :movie_id }
end
