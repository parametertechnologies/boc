Rails.application.routes.draw do
  get 'profiles/show'

  devise_for :users
  root to: "patients#index"
  get 'profile', to: 'profiles#show', as: :profile
  resources :doctors
  resources :patients
end
