class AddDishesToVotes < ActiveRecord::Migration[6.0]
  def change
    add_reference :votes, :dish, null: false, foreign_key: true
  end
end
