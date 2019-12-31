class Dish < ApplicationRecord
  belongs_to :restaurant
  has_many :votes, dependent: :destroy
  # has_many :comments, dependent: :destroy
  has_many :users, through: :votes
  # has_many :users, through: :comments
end
