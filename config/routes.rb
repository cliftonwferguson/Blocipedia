Rails.application.routes.draw do

get 'users/change-role', to: 'users#change_role'

post 'users/change-role', to: 'users#update_role'

 resources :wikis

 resources :charges, only: [:new, :create, :destroy]

  root to: 'wikis#index'

  devise_for :users
  resources  :users, :only => [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  

end
