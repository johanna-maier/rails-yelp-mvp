Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get 'restaurants', to: 'restaurants#index'
  # get 'restaurants/new', to: 'restaurants#new'
  # post 'restaurants', to: 'restaurants#create'
  # get 'restaurants/:id', to: 'restaurants#show', as: 'restaurant'

  root to: 'restaurants#index'

  resources :restaurants, only: [ :index, :new, :create, :show ] do
    resources :reviews, only: [ :index, :new, :create ]
  end

end
