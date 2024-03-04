Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :users
  resources :posts

  root "users#show"
end
