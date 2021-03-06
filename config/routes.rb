Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { registrations: 'registrations' }

  mount ActionCable.server => '/cable'
  
  resources :users do
    resources :member_ships
  end

  resources :groups do
    resources :member_ships
    member do
      get 'info'
    end
  end

  resources :invitations do
    member do 
      get 'accept'
    end
  end

  resources :messages
  
  resources :posts do
    scope module: 'post' do
      resources :likes, only: [:create, :destroy]
    end
  end

  resources :comments do
    scope module: 'comment' do
      resources :likes, only: [:create, :destroy]
    end 
  end

  resources :member_ships, only: [:destroy, :update]
 
  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  resources :users, only: :show
end
