class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :validatable
  has_many :searches, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  validates :email, uniqueness: true
end
