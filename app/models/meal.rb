class Meal < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
end
