class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  # validation
  validates :comment, length: { minimum: 6 }
  validates :comment, presence: true
  validates :list_id, uniqueness: { scope: :movie_id }
end
