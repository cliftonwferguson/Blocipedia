Rails.application.routes.draw do

  get 'wikis/index'

  get 'wikis/show'

  get 'wikis/new'

  get 'wikis/edit'

  root to: 'pages#home'

  devise_for :users
  resources  :users, :only => [:index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
