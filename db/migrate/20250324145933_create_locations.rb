class CreateLocations < ActiveRecord::Migration[8.0]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :country
      t.decimal :lat
      t.decimal :lng

      t.timestamps
    end
  end
end
