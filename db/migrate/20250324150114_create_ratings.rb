class CreateRatings < ActiveRecord::Migration[8.0]
  def change
    create_table :ratings do |t|
      t.integer :user_id
      t.integer :song_id
      t.integer :rating

      t.timestamps
    end
  end
end
