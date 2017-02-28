class DocumentsController < ApplicationController
    def index
        user = User.find(current_user.id)
        @documents = user.documents
        @locations = Location.where(user_id: current_user.id)
    end

    def show
        @document = Document.find(params[:id])
        @locations = Location.where(user_id: current_user.id)
    end

    def new 
        user = User.find(current_user.id)
        @documents = user.documents
        @locations = Location.where(user_id: current_user.id)
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
        @user_document = UserDocument.new(
            user_id: current_user.id, 
            document_id: @document.id  
            )
        @user_document.save
        flash[:success] = "document created"
        redirect_to "/documents"
    end 

    def edit 
        @document = Document.find(params[:id])
    end 

    def update
        @document = Document.find(params[:id])
        @document.assign_attributes(
            file_name: params[:file_name],
            file_text: params[:file_text]
            )
        @document.save
        flash[:success] = "Document updated"
        redirect_to "/documents/#{@document.id}"
    end 

    def destroy
        @document = Document.find(params[:id])
        @document.destroy
        flash[:success] = "Document deleted"
        redirect_to "/documents/new"
    end

end
