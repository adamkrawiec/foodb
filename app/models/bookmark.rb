class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :meal

  validates :meal, uniqueness: { scope: :user_id }
end
