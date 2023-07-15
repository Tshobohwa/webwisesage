# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "users#index", as: "users"
  get "/users/:id", to: "users#show", as: "user"
  get "/users/:id/posts", to: "posts#index", as: "posts"
  get "users/:author_id/posts/new", to: "posts#new"
  post "users/:author_id/posts", to: "posts#create"
  get "/users/:author_id/posts/:id", to: "posts#show", as: "post"
  get "users/:author_id/posts/:id/comments/new", to: "comments#new"
  post "users/:author_id/posts/:id/comments", to: "comments#create"
  post "users/:author_id/posts/:id", to: "likes#create", as: "like_post"
  get "api/users/:author_id/posts", to: "api/posts#index"

  resources :posts, only: [:index, :show, :new]
end
