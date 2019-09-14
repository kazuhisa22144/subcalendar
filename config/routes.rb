Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'users#top'
  resources :users, only: [:index,:show, :edit, :update]
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
  root to: 'calendar#index'
  get 'calendar/index'
  get 'events', to: 'event#show'
  post 'events/create', to: 'event#create'

end
