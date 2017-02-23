class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.float :latitude, precision: 9, scale: 6
      t.float :longitude, precision: 9, scale: 6
      t.float :distance_to, precision: 9, scale: 6
      t.string :name
      t.integer :user_id
      t.string :address

      t.timestamps
    end
  end
end

      # t.integer :latitude
      # t.integer :longitude
      # t.integer :distance_to