class CreateEventSongs < ActiveRecord::Migration[8.0]
  def change
    create_table :event_songs do |t|
      t.integer :event_id
      t.integer :song_id
      t.integer :event_participant_id
      t.boolean :is_performed
      t.integer :order
      t.string :song_name

      t.timestamps
    end
  end
end
