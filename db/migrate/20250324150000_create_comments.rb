class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.references :user, null: false, foreign_key: { to_table: :users }
      t.references :event, null: false, foreign_key: true
      t.text :content

      t.timestamps
    end

    add_index :comments, :user_id
    add_index :comments, :event_id
  end
end
