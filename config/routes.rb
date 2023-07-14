# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  get "/users/:id", to: "users#show"
  get "/users/:id/posts", to: "posts#index"
  get "users/:author_id/posts/new", to: "posts#new"
  post "users/:author_id/posts", to: "posts#create"
  get "/users/:author_id/posts/:id", to: "posts#show"
  get "users/:author_id/posts/:id/comments/new", to: "comments#new"
  post "users/:author_id/posts/:id/comments", to: "comments#create"
  post "users/:author_id/posts/:id", to: "likes#create", as: "like_post"

  resources :posts, only: [:index, :show, :new]
end
