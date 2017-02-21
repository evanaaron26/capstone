Rails.application.routes.draw do
    
    get '/' => 'users#index'
    get '/signup' => 'users#new'
    post '/users' => 'users#create'
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    get '/logout' => 'sessions#destroy'

    get '/documents' => 'documents#index'
    get '/documents/new' => 'documents#new'
    post '/documents' => 'documents#create'
    get '/documents/:id' => 'documents#show'
    get '/documents/:id/edit' => 'documents#edit'
    patch '/documents/:id' => 'documents#update'
    delete '/documents/:id' => 'documents#destroy'

    get '/locations/new' => 'locations#new'
    post '/locations' => 'locations#create'


end
