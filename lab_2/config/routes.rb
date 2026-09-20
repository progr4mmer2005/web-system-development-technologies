Rails.application.routes.draw do
  resources :microposts
  root "users#index"
  resources :users
  get "up" => "rails/health#show", as: :rails_health_check
end
