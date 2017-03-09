class UserDocumentsController < ApplicationController
        def new

        @user = User.find_by(email: params[:email])

        @user_document = UserDocument.new(
        user_id: @user.id, 
        document_id: params[:document]
        )
        @user_document.save

        redirect_to "/documents" 
    end 
end
