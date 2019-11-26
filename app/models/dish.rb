class Dish < ApplicationRecord
  belongs_to :restaurant
  has_many :votes
  has_many :comments
  has_many :users, through: :votes
  has_many :users, through: :comments
end
