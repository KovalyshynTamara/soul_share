class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.datetime :start_at
      t.datetime :end_at
      t.references :location, foreign_key: true
      t.string :image
      t.string :status
      t.references :created_by, foreign_key: { to_table: :users }
      t.references :current_song, foreign_key: { to_table: :songs }
      t.references :current_performer, foreign_key: { to_table: :users }
      t.string :mode
      t.boolean :comments_enabled, default: true

      t.timestamps
    end
  end
end
