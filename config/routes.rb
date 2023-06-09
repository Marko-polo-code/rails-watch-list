Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Lists
  resources :lists, only: [:index, :show, :new, :create] do
    # Bookmarks
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only: :destroy

  root to: 'lists#index'
end
