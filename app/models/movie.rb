class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :lists, through: :bookmarks

  # validation
  validates :title, uniqueness: true
  validates :overview, uniqueness: true
  validates :title, presence: true
  validates :overview, presence: true
end
