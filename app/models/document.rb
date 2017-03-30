class Document < ApplicationRecord
    has_many :user_documents
    has_many :users, through: :user_documents
    belongs_to :location
    has_attached_file :doc, :default_url => "missing.jpg"
    validates_attachment :doc, :content_type => {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}
end

