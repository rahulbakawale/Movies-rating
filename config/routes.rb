Rails.application.routes.draw do
  
   get '/movies/filter/:filter' => "movies#index", as: :filter_movies
   # get 'users/:user_id' => 'users#show', as: :profile
  resources :users
  resource :session, only: [:new,:create,:destroy]  
   #get '/movies' => 'movies#index'
   #get '/movies/new'  => 'movies#new', as: 'new_movie'
   #get '/movies/:id' => 'movies#show', as: 'movie'
   #get  "/movies/:id/edit" => 'movies#edit',as:'movie_edit'
   #patch '/movies/:id' => 'movies#update'
   #post  '/movies' => 'movies#create'
   #delete 'movies/:id' => 'movies#destroy',as: :destroy_movie
    resources :movies do
     resources :reviews
      
     resources :likes
    end   
   root :to => 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

