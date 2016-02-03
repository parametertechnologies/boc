Rails.application.routes.draw do
  devise_for :users
  root to: "patients#index"
  resources :doctors
  resources :patients
end
