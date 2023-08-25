class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks

  # validation
  validates :name, uniqueness: true
  validates :name, presence: true

end
