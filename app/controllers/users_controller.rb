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
        @user = User.find(params[:id])
        @user.assign_attributes(
            current_location: params[:current_location]
            )
        @user.save
        flash[:success] = "Location updated"
        redirect_to "/documents" 
    end 

end
