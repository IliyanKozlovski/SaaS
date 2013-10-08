Rottenpotatoes::Application.routes.draw do
  resources :movies
  get 'movies/:id/same_director' => 'movies#same_director', :as => :same_director
  root :to => redirect('/movies')
end
