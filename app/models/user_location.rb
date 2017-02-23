class UserLocation < ApplicationRecord
    belongs_to :user
    belongs_to :location 

    validates :user_id, uniqueness: {
        scope: :location_id, 
        message: "user already exists" }
           
end
