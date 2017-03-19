class SessionsController < ApplicationController
    def new
        render 'new.html.erb' 
    end 

    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            flash[:success] = 'Succcessfully created user'
            redirect_to '/locations/new'
        else
            flash[:warning] = 'Invalid username and password'
            redirect_to '/login'
        end 
    end 

    def destroy
        session[:user_id] = nil 
        flash[:success] = 'Succcessfully logged out'
        redirect_to '/login'
    end 

end
