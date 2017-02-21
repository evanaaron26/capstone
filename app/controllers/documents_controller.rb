class DocumentsController < ApplicationController
    def index
        
    end

    def show
        @document = Document.find(params[:id])
    end

    def new 
        user = User.find(current_user.id)
        @documents = user.documents
        @locations = Location.all
    end 

    def create 
        @location = Location.new(
            name: params[:name],
            latitude: params[:latitude],
            longitude: params[:longitude],
            distance_to: params[:distance_to]
            )

        @location.save

        @document = Document.new(
            file_name: params[:file_name],
            location_id: params[:location][:location_id],
            file_text: params[:file_text]                  
            )

        @document.save
        flash[:success] = "document created"
        redirect_to "/documents/new"
    end 

end
