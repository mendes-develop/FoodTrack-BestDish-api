class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :dish

  validates :stars, presence: true, numericality: { only_integer: true, less_than_or_equal_to: 5, greater_than_or_equal_to: 1 }
end
