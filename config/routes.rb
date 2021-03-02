Rails.application.routes.draw do

  resources :nominated_movies
  post '/create-or-ignore-movie', to: "nominated_movies#create_or_ignore_movie"
  root to: 'application#home'

end
