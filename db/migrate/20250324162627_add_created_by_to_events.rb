class AddCreatedByToEvents < ActiveRecord::Migration[8.0]
  def change
    add_reference :events, :created_by, foreign_key: { to_table: :users }, null: true
  end
end
