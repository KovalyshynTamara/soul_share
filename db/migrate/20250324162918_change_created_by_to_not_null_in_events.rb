class ChangeCreatedByToNotNullInEvents < ActiveRecord::Migration[8.0]
  def change
    change_column_null :events, :created_by_id, false
  end
end
