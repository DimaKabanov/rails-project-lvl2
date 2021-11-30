# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:locale)', locale: /en|ru/ do
    root 'posts#index'
    devise_for :users
    resources :posts, only: %i[index new create show] do
      scope module: :posts do
        resources :comments, only: %i[create]
        resources :likes, only: %i[create destroy]
      end
    end
  end
end
