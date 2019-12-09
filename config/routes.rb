Rails.application.routes.draw do
   get '/movies' => 'movies#index'
   get '/movies/new'  => 'movies#new', as: 'new_movie'
   get '/movies/:id' => 'movies#show', as: 'movie'
   get  "/movies/:id/edit" => 'movies#edit',as:'movie_edit'
   patch '/movies/:id' => 'movies#update'
   post  '/movies' => 'movies#create'
   delete 'movies/:id' => 'movies#destroy',as: :destroy_movie
   root :to => 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
