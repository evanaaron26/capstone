class DocumentsController < ApplicationController
    def index
        
    end

    def show
        @document = Document.find(params[:id])
    end

    def new 
        @documents = Document.all
        @locations = Location.all
    end 

    def create 
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
