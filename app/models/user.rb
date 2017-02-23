class User < ApplicationRecord
    has_many :user_documents
    has_many :documents, through: :user_documents
    # has_many :locations
    has_many :user_locations
    has_many :locations, through: :user_locations
    has_secure_password 
end
