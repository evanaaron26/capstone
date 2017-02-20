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
            distance_to: params[:distance_to]
            )

        @location.save
        flash[:success] = "location created"
        redirect_to "/documents/new"
    end 

end
