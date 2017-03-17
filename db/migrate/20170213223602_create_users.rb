class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :current_location
      t.string :current_latitude 
      t.string :current_longitude
      
      t.timestamps
    end
  end
end
