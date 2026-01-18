Rails.application.routes.draw do
  get 'movies/search'
  get 'bookmarks/create'
  get 'bookmarks/destroy'
  get 'lists/index'
  get 'lists/show'
  get 'lists/new'
  get 'lists/create'
  resources :lists, only: [:index, :show, :new, :create] do
    resources :bookmarks, only: [:create]
  end

  resources :bookmarks, only: [:destroy]
  
  get "movies/search", to: "movies#search"
  root "lists#index"
end