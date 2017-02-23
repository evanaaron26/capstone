class LocationsController < ApplicationController
    def index
        @locations = Location.all
    end

    def show
        @locations = Location.find(params[:id])
    end

    def new 

    end 

    def create 
        @location = Location.new(
            name: params[:name],
            latitude: params[:latitude],
            longitude: params[:longitude],
            distance_to: params[:distance_to],
            user_id: current_user.id
            )

        @location.save
        flash[:success] = "location created"
        redirect_to "/documents/new"
    end 

    def users
        @location = Location.find(params[:id])
    end 

    def useradd
        p "========="
        p params[:location]
        p params[:email]

        @user = User.find_by(email: params[:email])
        if @user 
            @user_location = UserLocation.new(
                user_id: @user.id,
                location_id: params[:location]
            )
            # if @user_location == 
            p "============="
            p @user_location.user_id
            p @user_location.location_id

            @user_location.save
            flash[:success] = "User assigned"
            redirect_to "/documents/new"
        else
            flash[:success] = "User not found"
            redirect_to "/documents/new" 
        end 
    end 
end
