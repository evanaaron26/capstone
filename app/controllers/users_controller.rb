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
            redirect_to '/'
        else 
            flash[:warning] = "Invalid password"
            redirect_to '/signup'
        end 
    end  

end
