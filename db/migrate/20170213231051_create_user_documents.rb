class CreateUserDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :user_documents do |t|
      t.integer :user_id
      t.integer :document_id
      t.boolean :admin_right
      
      t.timestamps
    end
  end
end
