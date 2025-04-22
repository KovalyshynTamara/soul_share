class CreateEventSongs < ActiveRecord::Migration[8.0]
  def change
    create_table :event_songs do |t|
      t.references :event, null: false, foreign_key: true
      t.references :song, null: false, foreign_key: true
      t.references :event_participant, null: false, foreign_key: true
      t.boolean :is_performed, default: false
      t.integer :order
      t.string :song_name

      t.timestamps
    end
  end
end
