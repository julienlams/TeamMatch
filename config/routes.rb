Rails.application.routes.draw do
  get 'users/show'
  get 'competitions/new'
  get 'competitions/create'
  devise_for :users
  root to: "pages#home"
  resources :competitions, only: [:new, :create, :show, :index]
  resources :chatrooms, only: :show do
    resources :messages, only: :create
  end

  resources :competitions do
    resources :teams, only: [:new, :create, :edit, :update, :destroy] do
      member do
        post 'register'
      end
    end
  end

  resources :membership_requests, only: [] do
    member do
      post 'approve'
    end
  end

  resources :users, only: [:show]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
