class DocumentsController < ApplicationController
    def index
        user = User.find(current_user.id)
        @documents = user.documents
        # @locations = Location.where(user_id: current_user.id)
        @locations = Location.all
        p @locations

        all_documents = Document.all 
        @nearby_documents = []
        all_documents.each do |document|
            p document.location.distance_to(current_user.current_location)
            if document.location.distance_to(current_user.current_location) < 1
                @nearby_documents << document 
            end
        end
        @my_nearby_documents = [] 
        @nearby_documents.each do |document|
            document.users.each do |user|
                if user.id == current_user.id
                    @my_nearby_documents << document
                end 
            end     
        end
        @my_documents = []
        user_documents = user.documents
            user_documents.each do |document|
                document.user_documents.each do |user_document|
                    if user_document.admin_right == true
                        @my_documents << document
                    end 
                end 
            end

    end

    def show
        @document = Document.find(params[:id])
        @locations = Location.where(user_id: current_user.id)
    end

    def new 
        User.find(current_user.id)
        @documents = current_user.documents
        @locations = Location.where(user_id: current_user.id)
    end 

    def create 
        # user = User.find(current_user.id)
        @user = User.find(current_user.id)
        
        # @location = Location.find_or_create_by(
        #     name: params[:name],
        #     latitude: params[:latitude],
        #     longitude: params[:longitude]
        #     )
    

        @location = Location.new(
            name: params[:name],
            latitude: params[:latitude],
            longitude: params[:longitude]
            )
        @location.save


        @document = Document.new(
            doc: params[:doc],
            file_name: params[:file_name],
            location_id: params[:location][:location_id],
            file_text: params[:file_text]                  
            )


        if @document.save
            @user_document = UserDocument.new(
                user_id: current_user.id, 
                document_id: @document.id,
                admin_right: true
                )
            @user_document.save

            ExampleMailer.welcome_email(@user).deliver_later
            flash[:success] = "document created"
            redirect_to '/documents'
        else
            redirect_to "/documents/new"
        end
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
        redirect_to "/documents"
    end

    def email
        ExampleMailer.welcome_email("success").deliver_now
    end
end