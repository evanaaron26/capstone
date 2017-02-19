class Document < ApplicationRecord
    has_many :user_documents
    has_many :users, through: :user_documents
    belongs_to :location
end
