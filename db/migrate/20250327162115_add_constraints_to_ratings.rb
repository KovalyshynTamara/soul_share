class AddConstraintsToRatings < ActiveRecord::Migration[8.0]
  def change
    change_column_null :ratings, :user_id, false
    change_column_null :ratings, :song_id, false
    unless foreign_key_exists?(:ratings, :users)
      add_foreign_key :ratings, :users
    end

    unless foreign_key_exists?(:ratings, :songs)
      add_foreign_key :ratings, :songs
    end
  end
end
