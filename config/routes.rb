Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  root 'static_pages#index'

  get 'signup' => 'users#new'
  get 'users/:id/likes' => 'users#likes'

  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'help' => 'static_pages#help'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users do
    member do
      get :following, :followers
    end
  end

  # resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :posts do
    resource :likes, :only => [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :relationships, only: [:create, :destroy]
end
