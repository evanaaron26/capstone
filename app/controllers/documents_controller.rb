class DocumentsController < ApplicationController
    def index
        @documents = Document.all
    end

    def show
        @documents = Document.find(params[:id])
    end

    def new 

    end 

    def create 
        @documents = Document.new(
            name: params[:name],
            latitude: params[:latitude],
            longitude: params[:longitude],
            distance_to: params[:distance_to]                
            )

        @documents.save
        flash[:success] = "document created"
        redirect_to "/documents/#{@document.id}"
    end 

end
