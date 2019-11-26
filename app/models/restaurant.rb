class Restaurant < ApplicationRecord
    has_many :favorites
    has_many :dishes

    has_many :users, through: :favorites
    has_many :votes, through: :dishes
    has_many :commments, through: :dishes
end
