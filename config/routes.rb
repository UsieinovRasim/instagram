# frozen_string_literal: true

Rails.application.routes.draw do
  resources :likes, only: %i[create destroy]

  resources :messages, only: %i[index create destroy new show] do
    post 'replies', to: 'messages#create_reply'
  end

  get 'profiles/index'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :users
  resources :posts
  resources :comments

  post 'users/:id/follow', to: 'users#follow', as: 'follow'
  delete 'users/:id/unfollow', to: 'users#unfollow', as: 'unfollow'
  post 'users/:id/accept', to: 'users#accept', as: 'accept'
  post 'users/:id/decline', to: 'users#decline', as: 'decline'
  delete 'users/:id/cancel', to: 'users#cancel', as: 'cancel'

  root 'users#show'
end
