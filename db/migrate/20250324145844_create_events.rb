class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :start_at
      t.datetime :end_at
      t.integer :location_id
      t.string :image
      t.string :status
      t.integer :created_by
      t.integer :current_song_id
      t.integer :current_performer_id
      t.string :mode
      t.boolean :comments_enabled

      t.timestamps
    end
  end
end
