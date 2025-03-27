class CreateCommentModerations < ActiveRecord::Migration[8.0]
  def change
    create_table :comment_moderations do |t|
      t.integer :comment_id
      t.integer :moderator_id
      t.string :action
      t.text :reason

      t.timestamps
    end
  end
end
