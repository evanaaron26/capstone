class AddAttachmentImageToDocuments < ActiveRecord::Migration
  def change
    add_attachment :documents, :image
  end
end


