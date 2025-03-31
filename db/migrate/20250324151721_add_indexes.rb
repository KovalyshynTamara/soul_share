class AddIndexes < ActiveRecord::Migration[8.0]
  def change
    add_index :songs, :added_by
    add_index :events, :created_by
    add_index :events, :location_id
    add_index :event_songs, :event_id
    add_index :event_songs, :song_id
    add_index :event_songs, :event_participant_id
    add_index :comments, :user_id
    add_index :comments, :event_id
    add_index :comment_moderations, :comment_id
    add_index :comment_moderations, :moderator_id
    add_index :favorites, [ :user_id, :song_id ], unique: true
    add_index :ratings, [ :user_id, :song_id ], unique: true
    add_index :event_participants, [ :event_id, :user_id ], unique: true
  end
end
