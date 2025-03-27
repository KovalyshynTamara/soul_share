class AddMissingForeignKeys < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :songs, :users, column: :added_by
    add_foreign_key :events, :users, column: :created_by
    add_foreign_key :events, :locations
    add_foreign_key :event_songs, :events
    add_foreign_key :event_songs, :songs
    add_foreign_key :event_songs, :event_participants
    add_foreign_key :comments, :event_participants, column: :user_id
    add_foreign_key :comments, :events
    add_foreign_key :comment_moderations, :comments
    add_foreign_key :comment_moderations, :event_participants, column: :moderator_id
    add_foreign_key :favorites, :users
    add_foreign_key :favorites, :songs
    add_foreign_key :ratings, :users
    add_foreign_key :ratings, :songs
    add_foreign_key :event_participants, :users
    add_foreign_key :event_participants, :events
  end
end
