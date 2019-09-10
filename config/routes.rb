Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'users#top'
  resources :users, only: [:show, :edit, :update]

  root to: 'calendar#index'
  get 'calendar/index'
  get 'events', to: 'event#show'
  post 'events/create', to: 'event#create'

end
