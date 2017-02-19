class User < ApplicationRecord
    has_many :user_documents
    has_many :documents, through: :user_documents
    has_secure_password 
end
