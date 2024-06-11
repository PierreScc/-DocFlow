Rails.application.routes.draw do

  devise_for :users
  root 'landing#index'
  get 'home', to: 'pages#home'


  get "up" => "rails/health#show", as: :rails_health_check

  resources :groups, only: [:index, :show, :new, :destroy, :create, :update] do
    resources :documents, only: [:show, :new]
    resources :messages, only: [:new, :create, :index]
    resources :user_groups, only: [:create]
  end

  resources :documents, only: [:destroy, :index, :create, :show] do
    resources :comments, only: [:create]
    resources :assignements, only: [:new, :create]
  end

  get 'submit-group', to: 'groups#new', as: 'submit_group'
  post 'submit-group', to: 'groups#create'
end
