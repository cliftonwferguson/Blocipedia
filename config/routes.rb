Rails.application.routes.draw do

 resources :wikis

 resources :charges, only: [:new, :create]

  root to: 'wikis#index'

  devise_for :users
  resources  :users, :only => [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
