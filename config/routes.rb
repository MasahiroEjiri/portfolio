Rails.application.routes.draw do
    root to: 'toppages#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  
  get 'timeline', to: 'timelines#index'
  get 'search', to: 'timeline#search'
  get 'post', to: 'toppages#index'
 
 
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :create] do
    member do
      get :likes
    end
  end
  
  
  resources :topics, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
  
end
