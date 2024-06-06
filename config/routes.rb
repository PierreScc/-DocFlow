Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :groups, only: [:index, :show, :new, :destroy, :create] do
    resources :documents, only: [:show, :new, :create, :update]
    resources :messages, only: [:create]
    resources :user_groups, only: [:create]
  end

  resources :documents, only: [:destroy, :create, :index, :show] do
    resources :comments, only: [:create]
    resources :assignements, only: [:new, :create]
  end

  resources :users, only: [:show, :edit, :update]
  resources :messages, only: [:index]
  resources :groups
  resources :assignments, only: [:index, :show, :edit, :update, :destroy]

  # Route pour le formulaire de soumission de groupe
  get 'submit-group', to: 'groups#new', as: 'submit_group'
  post 'submit-group', to: 'groups#create'
end
