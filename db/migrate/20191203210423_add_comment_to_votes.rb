class AddCommentToVotes < ActiveRecord::Migration[6.0]
  def change
    add_column :votes, :comment, :text
  end
end
