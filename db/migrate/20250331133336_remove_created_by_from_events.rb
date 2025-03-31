class RemoveCreatedByFromEvents < ActiveRecord::Migration[8.0]
  def change
    remove_column :events, :created_by, :string
  end
end
