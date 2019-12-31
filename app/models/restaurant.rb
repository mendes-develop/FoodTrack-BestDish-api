class Restaurant < ApplicationRecord
    has_many :favorites, dependent: :destroy
    has_many :dishes, dependent: :destroy

    has_many :users, through: :favorites
    has_many :votes, through: :dishes
    # has_many :commments, through: :dishes
end
