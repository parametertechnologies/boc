Rails.application.routes.draw do
  devise_for :users
  root to: "doctors#index"
  resources :doctors
  resources :patients
end
