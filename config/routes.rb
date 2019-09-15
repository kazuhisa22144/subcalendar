Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index,:show, :edit, :update]
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  resource :post_comments, only: [:create, :destroy]
  resource :likes, only: [:create, :destroy]
end
  root 'users#top'
  root to: 'calendar#index'
  get 'calendar/index'
  get 'events', to: 'event#show'
  post 'events/create', to: 'event#create'
end