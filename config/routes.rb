# frozen_string_literal: true

Rails.application.routes.draw do
  root to: "users#index"
  get "/users/:id", to: "users#show"
  get "/users/:id/posts", to: "posts#index"
  get "/users/:author_id/posts/:id", to: "posts#show"

  resources :posts, only: [:index, :show]
end
