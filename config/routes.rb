Rails.application.routes.draw do
    get '/' => 'users#index'
    # get '/users' => 'users#index'
    # get '/users/new' => 'users#new'
    # post '/users' => 'users#create'
    # get '/users/:id' => 'users#show'
    # get '/users/:id/edit' => 'users#edit'
    # patch '/users/:id' => 'users#update'
    # delete '/users/:id' => 'uers#destroy'

    get '/signup' => 'users#new'
    post '/users' => 'users#create'
    get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    get '/logout' => 'sessions#destroy'

end
