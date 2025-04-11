class CreateCommentModerations < ActiveRecord::Migration[8.0]
  def change
    create_table :comment_moderations do |t|
      t.references :comment, null: false, foreign_key: true
      t.references :moderator, null: false, foreign_key: { to_table: :event_participants }
      t.string :action
      t.text :reason

      t.timestamps
    end

    add_index :comment_moderations, :comment_id
    add_index :comment_moderations, :moderator_id
  end
end
