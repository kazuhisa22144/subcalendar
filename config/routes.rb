Rails.application.routes.draw do
  devise_for :users
  root 'post_images#top'
  root to: 'calendar#index'
  get '/users/search' => 'users#search'
  get 'calendar/index'
  get 'events', to: 'event#show'
  get 'post_images_top2', to: 'post_images#top2'
  post 'events/create', to: 'event#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index,:show, :edit, :update]
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  resource :post_comments, only: [:create, :destroy]
  resource :likes, only: [:create, :destroy]
end
end