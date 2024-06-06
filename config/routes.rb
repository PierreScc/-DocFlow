Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "up" => "rails/health#show", as: :rails_health_check

  resources :groups, only: [:index, :show, :new, :destroy, :create] do
    resources :documents, only: [:show, :new, :create]
    resources :messages, only: [:new, :create]
    resources :user_groups, only: [:create]
  end

  resources :documents, only: [:destroy, :index] do
    resources :comments, only: [:create]
    resources :assignements, only: [:new, :create]
  end

  # Route pour le formulaire de soumission de groupe
  get 'submit-group', to: 'groups#new', as: 'submit_group'
  post 'submit-group', to: 'groups#create'
end
