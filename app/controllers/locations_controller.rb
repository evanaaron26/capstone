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
        @locations = Location.new(
            name: params[:name],
            latitude: params[:latitude],
            longitude: params[:longitude],
            distance_to: params[:distance_to]
            )

        @locations.save
        flash[:success] = "location created"
        redirect_to "/locations/#{@location.id}"
    end 

end
