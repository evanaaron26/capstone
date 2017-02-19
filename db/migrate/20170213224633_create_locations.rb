class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.decimal :latitude, precision: 9, scale: 6
      t.decimal :longitude, precision: 9, scale: 6
      t.decimal :distance_to, precision: 9, scale: 6
      t.string :name
      t.integer :user_id

      t.timestamps
    end
  end
end

      # t.integer :latitude
      # t.integer :longitude
      # t.integer :distance_to