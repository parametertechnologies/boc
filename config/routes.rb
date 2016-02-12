Rails.application.routes.draw do
  get 'profiles/show'

  devise_for :users
  root to: "patients#index"
  get 'profile', to: 'profiles#show', as: :profile
  get 'admin', to: 'admin#index', as: :admin
  namespace :admin do
    resources :doctors
  end
  resources :doctors
  resources :patients
end
