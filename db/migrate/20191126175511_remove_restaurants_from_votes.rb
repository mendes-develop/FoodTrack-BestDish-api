class RemoveRestaurantsFromVotes < ActiveRecord::Migration[6.0]
  def change
    remove_reference :votes, :restaurant, null: false, foreign_key: true
  end
end
