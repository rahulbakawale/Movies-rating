Rails.application.routes.draw do
   get '/movies' => 'movies#index'
   get '/movies/:id' => 'movies#show', as: 'movie'
   get  "/movies/:id/edit" => 'movies#edit',as:'movie_edit'
   root :to => 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
