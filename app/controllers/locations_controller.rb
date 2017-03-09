class LocationsController < ApplicationController
    def index
      if params[:search].present?
        @locations = Location.near(params[:search], 50, :order => :distance)
      else
        @locations = Location.all
      end
    end

    def show
        @location = Location.find(params[:id])
    end

    def new 

    end 

    def create 
        @location = Location.new(
            name: params[:name],
            address: params[:address],
            user_id: current_user.id
            )

        @location.save
        flash[:success] = "location created"
        redirect_to "/locations/#{@location.id}"
    end 

    def users
        @location = Location.find(params[:id])
    end 

    def useradd

        @user = User.find_by(email: params[:email])
        if @user 
            @user_location = UserLocation.new(
                user_id: @user.id,
                location_id: params[:location]
            )
   
            @user_location.save
            flash[:success] = "User assigned"
            redirect_to "/documents/new"
        else
            flash[:success] = "User not found"
            redirect_to "/documents/new" 
        end 
    end 
end
