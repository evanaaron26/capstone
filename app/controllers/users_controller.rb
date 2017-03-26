class UsersController < ApplicationController

    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end 

    def new

    end

    def create 
        @user = User.new(
            email: params[:email],
            password: params[:password],
            password_confirmation: params[:password_confirmation]
            )

        if @user.save 
            session[:user_id] = @user.id 
            flash[:success] = "User created"
            redirect_to '/locations/new'
        else 
            flash[:warning] = "Invalid password"
            redirect_to '/signup'
        end 
    end 

    def edit 
        
        @user = User.find(current_user.id)
    end 

    def update
        @user = User.find(current_user.id)
        first_result = Geocoder.search(params[:current_location]).first
        long_lat = Geocoder.coordinates(first_result.address)
        longitude = long_lat.first  
        latitude = long_lat.last 
        if first_result.present? 
            first_result = first_result.address
        end 
        @user.assign_attributes(
            current_location: first_result,
            current_latitude: latitude,
            current_longitude: longitude  
            )

        @user.save

        flash[:success] = "Location updated"
        redirect_to "/locations/new" 
    end 
end




