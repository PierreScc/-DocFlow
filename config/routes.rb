Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :groups, only: [:index, :show, :new, :update, :destroy, :create] do
    resources :documents, only: [:show]
    resources :messages, only: [:create]
    resources :user_groups, only: [:create]
  end

  resources :documents, only: [:index, :destroy] do
    resources :comments, only: [:create]
    resources :assignements, only: [:new, :create]
  end
  # Defines the root path route ("/")
  # root "posts#index"
end
