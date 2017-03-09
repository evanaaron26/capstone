Rails.application.routes.draw do
    
    post '/user_documents/new' => 'user_documents#new'
    
    get '/' => 'users#index'
    get '/signup' => 'users#new'
    post '/users' => 'users#create'
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    get '/logout' => 'sessions#destroy'
    get '/users/:id/edit' => 'users#edit'
    patch '/users/:id' => 'users#update'
    get '/documents' => 'documents#index'
    get '/documents/new' => 'documents#new'
    post '/documents' => 'documents#create'
    get '/documents/:id' => 'documents#show'
    get '/documents/:id/edit' => 'documents#edit'
    patch '/documents/:id' => 'documents#update'
    delete '/documents/:id' => 'documents#destroy'


    get '/locations/new' => 'locations#new'
    post '/locations' => 'locations#create'
    get '/locations/:id' => 'locations#show'

    get '/locations/users/:id' => 'locations#users'
    post '/locations/useradd' => 'locations#useradd'

end
