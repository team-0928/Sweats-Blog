Rails.application.routes.draw do
  root 'static_pages#index'

  get 'signup' => 'users#new'
  get 'users/:id/likes' => 'users#likes'

  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'help' => 'static_pages#help'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users
  resources :account_activations, only: [:edit]
  resources :posts do
    resources :likes, :only => [:create, :destroy]
  end
end
